import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pathfinder/ui/util/context_utils.dart';

class NodePalette extends StatelessWidget {
  const NodePalette({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.pathfinderTheme.colors.backgroundColor,
      child: ListView(
        children: [
          _NewNodeButton(
            onPressed: () {
              // TODO: Implement.
            },
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
      child: InkWell(
        onTap: () => onPressed?.call(),
        child: Icon(
          Icons.add,
          color: context.pathfinderTheme.colors.primaryColor,
        ),
      ),
    );
  }
}
