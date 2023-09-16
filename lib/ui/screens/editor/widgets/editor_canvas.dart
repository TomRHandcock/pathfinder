import 'package:flutter/material.dart';
import 'package:pathfinder/engine/model/graph/graph.dart';
import 'package:pathfinder/ui/screens/editor/widgets/edge.dart';
import 'package:pathfinder/ui/screens/editor/widgets/node.dart';

class EditorCanvas extends StatelessWidget {
  final Graph graph;

  EditorCanvas({required this.graph, super.key});

  late final delegate = EditorCanvasLayoutDelegate(graph);

  @override
  Widget build(BuildContext context) {
    return CustomMultiChildLayout(
      delegate: delegate,
      children: graph.nodes
              .map(
                (node) => LayoutId(
                  id: "node-${node.id}",
                  child: NodeWidget(node: node),
                ),
              )
              .toList() +
          graph.edges.map((edge) {
            final startNode = graph.nodes.firstWhere(
              (node) => node.id == edge.startId,
            );
            final endNode = graph.nodes.firstWhere(
              (node) => node.id == edge.endId,
            );
            return LayoutId(
                id: "edge-${edge.id}",
                child: EdgeWidget(
                    edge: edge, startNode: startNode, endNode: endNode));
          }).toList(),
    );
  }
}

class EditorCanvasLayoutDelegate extends MultiChildLayoutDelegate {
  final Graph graph;

  EditorCanvasLayoutDelegate(this.graph) : super();

  @override
  void performLayout(Size size) {
    final nodeSizes = graph.nodes.map((node) {
      positionChild("node-${node.id}", Offset(node.xPosition, node.yPosition));
      final size = layoutChild(
        "node-${node.id}",
        const BoxConstraints(),
      );
      return SizedNode(node, size);
    }).toList();
    for (final edge in graph.edges) {
      final startNode =
          nodeSizes.firstWhere((element) => element.node.id == edge.startId);
      positionChild(
          "edge-${edge.id}",
          getPerimeterPosition(
              Offset(startNode.node.xPosition, startNode.node.yPosition),
              startNode.size,
              edge.startSide));
      layoutChild(
        "edge-${edge.id}",
        const BoxConstraints(),
      );
    }
  }

  Offset getPerimeterPosition(Offset node, Size size, double perimeter) {
    final path = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(node.dx, node.dy, size.width, size.height),
        const Radius.circular(16),
      ));
    final metrics = path.computeMetrics();
    final metric = metrics.elementAt(0);
    final offset = metric.length * perimeter;
    return metric.getTangentForOffset(offset)?.position ?? node;
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    if (oldDelegate is! EditorCanvasLayoutDelegate) {
      return true;
    }
    return graph != oldDelegate.graph;
  }
}
