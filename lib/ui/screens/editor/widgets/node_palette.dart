import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pathfinder/engine/model/graph/node_template.dart';
import 'package:pathfinder/ui/screens/editor/widgets/palette_item_preview.dart';
import 'package:pathfinder/ui/util/context_utils.dart';

class NodePalette extends StatelessWidget {
  final Function()? onNewNodeTemplatePressed;
  final List<NodeTemplate> templates;

  const NodePalette({
    super.key,
    required this.templates,
    this.onNewNodeTemplatePressed,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.pathfinderTheme.colors.backgroundColor,
      child: ListView.separated(
        itemCount: templates.length + 1,
        itemBuilder: (_, index) => switch(index) {
          0 => _NewNodeButton(
            onPressed: () => onNewNodeTemplatePressed?.call(),
          ),
          _ => PaletteItemPreview(template: templates[index - 1],),
        },
        padding: const EdgeInsets.all(8),
        separatorBuilder: (_, __) => const SizedBox(height: 8),
      ),
    );
  }
}

class _NewNodeButton extends StatelessWidget {
  final Function()? onPressed;

  const _NewNodeButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Material(
        borderRadius: BorderRadius.circular(16),
        color: context.pathfinderTheme.colors.backgroundColor,
        child: InkWell(
          splashColor: context.pathfinderTheme.colors.rippleColor,
          onTap: () => onPressed?.call(),
          child: Icon(
            Icons.add,
            color: context.pathfinderTheme.colors.textColor,
          ),
        ),
      ),
    );
  }
}
