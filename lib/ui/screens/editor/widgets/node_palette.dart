import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NodePalette extends StatelessWidget {
  const NodePalette({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _NewNodeButton(
          onPressed: () {
            // TODO: Implement.
          },
        ),
      ],
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
        child: const Icon(
          Icons.add
        ),
      ),
    );
  }
}
