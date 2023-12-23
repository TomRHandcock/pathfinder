import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pathfinder/engine/model/graph/node_palette.dart';
import 'package:pathfinder/engine/model/graph/node_template.dart';
import 'package:pathfinder/engine/util/object_utils.dart';
import 'package:pathfinder/ui/util/context_utils.dart';

class ItemPreview extends StatelessWidget {
  final NodeItem item;
  final Function(String parentId, NodePaletteItem item)? onItemAdded;

  const ItemPreview({
    super.key,
    required this.item,
    this.onItemAdded,
  });

  @override
  Widget build(BuildContext context) {
    return switch (item) {
      NodeItemContainer() => _Container(
          item: item as NodeItemContainer,
          onItemAdded: onItemAdded,
        ),
      NodeItemColumn() => _Column(
          item: item as NodeItemColumn,
          onItemAdded: onItemAdded,
        ),
      NodeItemRow() => _Row(
          item: item as NodeItemRow,
          onItemAdded: onItemAdded,
        ),
      NodeItemText() => _Text(
          item: item as NodeItemText,
        ),
      NodeItemImage() => const _Image(),
      _ => const Placeholder(),
    };
  }
}

class _Container extends StatelessWidget {
  final NodeItemContainer item;
  final Function(String parentId, NodePaletteItem item)? onItemAdded;

  const _Container({
    super.key,
    required this.item,
    this.onItemAdded,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: context.pathfinderTheme.colors.textColor),
        color: context.pathfinderTheme.colors.backgroundColor,
      ),
      child: item.child?.let(
            (it) => ItemPreview(
              item: it,
              onItemAdded: onItemAdded,
            ),
          ) ??
          SizedBox(
            width: 200,
            height: 200,
            child: DragTarget(
              builder: (context, candidateItems, rejectedItems) {
                return (candidateItems.isNotEmpty)
                    ? const ColoredBox(color: Colors.blueGrey)
                    : const SizedBox.shrink();
              },
              onWillAccept: (Object? candidate) => candidate is NodePaletteItem,
              onAccept: (Object? candidate) {
                final descendant = candidate as NodePaletteItem;
                onItemAdded?.call(item.id, descendant);
              },
            ),
          ),
    );
  }
}

class _Column extends StatelessWidget {
  final NodeItemColumn item;
  final Function(String parentId, NodePaletteItem item)? onItemAdded;

  const _Column({
    super.key,
    required this.item,
    this.onItemAdded,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: context.pathfinderTheme.colors.textColor),
        color: context.pathfinderTheme.colors.backgroundColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final child in item.children)
            ItemPreview(
              item: child,
              onItemAdded: onItemAdded,
            ),
          SizedBox(
            width: 50,
            height: 100,
            child: DragTarget(
              builder: (context, candidateItems, rejectedItems) {
                return (candidateItems.isNotEmpty)
                    ? const ColoredBox(color: Colors.blueGrey)
                    : const SizedBox.shrink();
              },
              onWillAccept: (Object? candidate) => candidate is NodePaletteItem,
              onAccept: (Object? candidate) {
                final descendant = candidate as NodePaletteItem;
                onItemAdded?.call(item.id, descendant);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Row extends StatelessWidget {
  final NodeItemRow item;
  final Function(String parentId, NodePaletteItem item)? onItemAdded;

  const _Row({
    super.key,
    required this.item,
    this.onItemAdded,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: context.pathfinderTheme.colors.textColor),
        color: context.pathfinderTheme.colors.backgroundColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final child in item.children)
            ItemPreview(
              item: child,
              onItemAdded: onItemAdded,
            ),
          SizedBox(
            width: 50,
            height: 200,
            child: DragTarget(
              builder: (context, candidateItems, rejectedItems) {
                return (candidateItems.isNotEmpty)
                    ? const ColoredBox(color: Colors.blueGrey)
                    : const SizedBox.shrink();
              },
              onWillAccept: (Object? candidate) => candidate is NodePaletteItem,
              onAccept: (Object? candidate) {
                final descendant = candidate as NodePaletteItem;
                onItemAdded?.call(item.id, descendant);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Text extends StatelessWidget {
  final NodeItemText item;

  const _Text({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        "Lorem Ipsum",
        style: context.pathfinderTheme.text.body.copyWith(
          fontSize: item.fontSize,
        ),
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: SvgPicture.asset(
        "assets/image/ic_image.svg",
        width: 100,
        height: 100,
      ),
    );
  }
}
