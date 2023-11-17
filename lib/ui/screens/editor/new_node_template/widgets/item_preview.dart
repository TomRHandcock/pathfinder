import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pathfinder/engine/model/graph/node_palette.dart';
import 'package:pathfinder/engine/model/graph/node_template.dart';
import 'package:pathfinder/engine/util/object_utils.dart';
import 'package:pathfinder/ui/screens/editor/new_node_template/cubit/new_node_template_cubit.dart';
import 'package:pathfinder/ui/screens/editor/new_node_template/new_node_template_screen.dart';
import 'package:pathfinder/ui/util/context_utils.dart';
import 'package:pathfinder/ui/widgets/theming/models.dart';

class ItemPreview extends StatelessWidget {
  final NodeItem item;

  const ItemPreview({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return switch (item) {
      NodeItemContainer() => _Container(
          item: item as NodeItemContainer,
        ),
      NodeItemColumn() => _Column(
          item: item as NodeItemColumn,
        ),
      NodeItemRow() => _Row(
          item: item as NodeItemRow,
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

  const _Container({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: context.pathfinderTheme.colors.textColor),
        color: context.pathfinderTheme.colors.backgroundColor,
      ),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: item.child?.let((it) => ItemPreview(item: it)) ??
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
                context.read<NewNodeTemplateCubit>().addItem(
                      item.id,
                      descendant,
                    );
              },
            ),
          ),
    );
  }
}

class _Column extends StatelessWidget {
  final NodeItemColumn item;

  const _Column({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: context.pathfinderTheme.colors.textColor),
        color: context.pathfinderTheme.colors.backgroundColor,
      ),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final child in item.children) ItemPreview(item: child),
          SizedBox(
            width: 200,
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
                context.read<NewNodeTemplateCubit>().addItem(
                      item.id,
                      descendant,
                    );
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

  const _Row({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: context.pathfinderTheme.colors.textColor),
        color: context.pathfinderTheme.colors.backgroundColor,
      ),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final child in item.children) ItemPreview(item: child),
          SizedBox(
            width: 100,
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
                context.read<NewNodeTemplateCubit>().addItem(
                      item.id,
                      descendant,
                    );
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
