import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pathfinder/ui/util/context_utils.dart';

class NodePalette extends StatelessWidget {
  final Function()? onNewNodeTemplatePressed;

  const NodePalette({
    super.key,
    this.onNewNodeTemplatePressed,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.pathfinderTheme.colors.backgroundColor,
      child: ListView(
        children: [
          _NewNodeButton(
            onPressed: () => onNewNodeTemplatePressed?.call(),
          ),
        ],
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
