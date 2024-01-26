import 'package:flutter/material.dart';
import 'package:pathfinder/ui/util/context_utils.dart';

class PathfinderTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String value)? onChanged;

  const PathfinderTextField({
    required this.controller,
    this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: context.pathfinderTheme.colors.textColor,
      decoration: context.pathfinderTheme.input.textfield,
      onChanged: onChanged,
      style: context.pathfinderTheme.text.bodyLarge,
    );
  }
}
