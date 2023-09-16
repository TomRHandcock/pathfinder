import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pathfinder/engine/model/graph/edge.dart';
import 'package:pathfinder/engine/model/graph/node.dart';
import 'package:pathfinder/engine/util/list_utils.dart';
import 'package:pathfinder/ui/screens/editor/widgets/editor_canvas.dart';
import 'package:vector_math/vector_math.dart' as Vector;

class SizedNode {
  final Node node;
  final Size size;

  const SizedNode(this.node, this.size);
}

class EdgeWidget extends StatelessWidget {
  final Edge edge;
  final GraphController controller;

  const EdgeWidget({
    super.key,
    required this.edge,
    required this.controller,
  });

  SizedNode? get startNode => controller.nodeSizes
      .firstWhereOrNull((node) => node.node.id == edge.startId);

  SizedNode? get endNode => controller.nodeSizes
      .firstWhereOrNull((node) => node.node.id == edge.endId);

  @override
  Widget build(BuildContext context) {
    final localStart = startNode;
    final localEnd = endNode;
    if (localStart == null || localEnd == null) {
      return Container();
    }
    final startTan = EditorCanvasLayoutDelegate.getPerimeterPosition(
      localStart.node.position,
      localStart.size,
      edge.startSide,
    );
    final endTan = EditorCanvasLayoutDelegate.getPerimeterPosition(
      localEnd.node.position,
      localEnd.size,
      edge.endSide,
    );
    if (startTan == null || endTan == null) {
      return Container();
    }
    return CustomPaint(
      painter: _EdgePainter(startTan, endTan),
    );
  }
}

class _EdgePainter extends CustomPainter {
  final Tangent startTangent;
  final Tangent endTangent;

  _EdgePainter(this.startTangent, this.endTangent);

  static final linePaint = Paint()
    ..color = Colors.blueGrey
    ..strokeWidth = 2
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    final startNormal =
        Vector.Vector2(startTangent.vector.dy, -startTangent.vector.dx)
            .normalized() * 50;
    final endNormal =
        Vector.Vector2(endTangent.vector.dy, -endTangent.vector.dx)
            .normalized() * 50;
    final path = Path()
      ..addPolygon([startTangent.position], false)
      ..cubicTo(
        startTangent.position.dx + startNormal.x,
        startTangent.position.dy + startNormal.y,
        endTangent.position.dx + endNormal.x,
        endTangent.position.dy + endNormal.y,
        endTangent.position.dx,
        endTangent.position.dy,
      );
    canvas.drawPath(path, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    if (oldDelegate is! _EdgePainter) {
      return true;
    }
    return startTangent != oldDelegate.startTangent ||
        endTangent != oldDelegate.endTangent;
  }
}
