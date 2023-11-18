import 'package:flutter/material.dart';
import 'package:pathfinder/ui/util/context_utils.dart';

class PathfinderTextField extends StatelessWidget {
  const PathfinderTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: context.pathfinderTheme.colors.textColor,
      decoration: context.pathfinderTheme.input.textfield,
      style: context.pathfinderTheme.text.bodyLarge,
    );
  }
}
