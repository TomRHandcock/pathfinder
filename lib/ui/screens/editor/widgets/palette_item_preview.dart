import 'package:flutter/material.dart';
import 'package:pathfinder/engine/model/graph/node_template.dart';
import 'package:pathfinder/engine/util/nullable_utils.dart';
import 'package:pathfinder/ui/util/context_utils.dart';

class PaletteItemPreview extends StatefulWidget {
  final NodeTemplate template;

  const PaletteItemPreview({
    required this.template,
    super.key,
  });

  @override
  State<PaletteItemPreview> createState() => _PaletteItemPreviewState();
}

class _PaletteItemPreviewState extends State<PaletteItemPreview> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: context.pathfinderTheme.colors.rippleColor
              .withOpacity(0.1)
              .takeIf(isHovered),
        ),
        padding: const EdgeInsets.all(4),
        child: MouseRegion(
          onEnter: (_) => setState(() {
            isHovered = true;
          }),
          onExit: (_) => setState(() {
            isHovered = false;
          }),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                widget.template.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.pathfinderTheme.text.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
