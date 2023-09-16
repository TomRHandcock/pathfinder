import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pathfinder/engine/model/graph/edge.dart';
import 'package:pathfinder/engine/model/graph/node.dart';

class SizedNode {
  final Node node;
  final Size size;

  const SizedNode(this.node, this.size);
}

class EdgeWidget extends StatelessWidget {
  final Edge edge;
  final Node startNode;
  final Node endNode;

  const EdgeWidget({
    super.key,
    required this.edge,
    required this.startNode,
    required this.endNode,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _EdgePainter(
        Offset(endNode.xPosition, endNode.yPosition) -
            Offset(startNode.xPosition, startNode.yPosition),
      ),
    );
  }
}

class _EdgePainter extends CustomPainter {
  final Offset delta;

  _EdgePainter(this.delta);

  static final linePaint = Paint()
    ..color = Colors.red
    ..strokeWidth = 5;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(Offset.zero, delta, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    if (oldDelegate is! _EdgePainter) {
      return true;
    }
    return delta != oldDelegate.delta;
  }
}
