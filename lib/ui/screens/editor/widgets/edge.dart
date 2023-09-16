import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pathfinder/engine/model/graph/edge.dart';
import 'package:pathfinder/engine/model/graph/node.dart';
import 'package:pathfinder/engine/util/list_utils.dart';
import 'package:pathfinder/ui/screens/editor/widgets/editor_canvas.dart';
import 'package:vector_math/vector_math.dart' as vector;

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

  static Tangent? getPerimeterPosition(SizedNode sizedNode, double perimeter) {
    final node = sizedNode.node;
    final size = sizedNode.size;
    final path = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(
          node.position.dx,
          node.position.dy,
          size.width,
          size.height,
        ),
        const Radius.circular(16),
      ));
    final metrics = path.computeMetrics();
    final metric = metrics.elementAt(0);
    final offset = metric.length * perimeter;
    return metric.getTangentForOffset(offset);
  }

  SizedNode? get startNode => controller.nodeSizes
      .firstWhereOrNull((node) => node.node.id == edge.startNode);

  SizedNode? get endNode => controller.nodeSizes
      .firstWhereOrNull((node) => node.node.id == edge.endNode);

  @override
  Widget build(BuildContext context) {
    final localStart = startNode;
    final localEnd = endNode;
    if(localStart == null) {
      throw StateError("Couldn't find node with ID: ${edge.startNode}");
    }
    if(localEnd == null) {
      throw StateError("Couldn't find node with ID: ${edge.endNode}");
    }
    final startTangent = getPerimeterPosition(localStart, edge.startSide);
    final endTangent = getPerimeterPosition(localEnd, edge.endSide);
    if(startTangent == null) {
      throw StateError("Couldn't find tangent at point ${edge.startSide} on node with ID: ${edge.startNode}");
    }
    if(endTangent == null) {
      throw StateError("Couldn't find tangent at point ${edge.endSide} on node with ID: ${edge.endNode}");
    }
    return CustomPaint(
      painter: _EdgePainter(startTangent, endTangent),
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
        vector.Vector2(startTangent.vector.dy, -startTangent.vector.dx)
                .normalized() *
            50;
    final endNormal =
        vector.Vector2(endTangent.vector.dy, -endTangent.vector.dx)
                .normalized() *
            50;
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
