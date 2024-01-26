import 'package:flutter/material.dart';
import 'package:pathfinder/ui/util/context_utils.dart';

class PathfinderFilledButton extends StatelessWidget {
  final String label;
  final Function()? onPressed;

  const PathfinderFilledButton({
    super.key,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          context.pathfinderTheme.colors.primaryColor,
        ),
        foregroundColor: MaterialStateProperty.all(
          context.pathfinderTheme.colors.textColor,
        ),
        minimumSize: MaterialStateProperty.all(
          const Size(double.infinity, 48),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
      ),
      child: Text(label),
    );
  }
}
