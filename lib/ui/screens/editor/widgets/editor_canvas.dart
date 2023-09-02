import 'package:flutter/material.dart';
import 'package:pathfinder/engine/model/graph/graph.dart';
import 'package:pathfinder/ui/screens/editor/widgets/node.dart';

class EditorCanvas extends StatelessWidget {
  final Graph graph;

  const EditorCanvas({required this.graph, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomMultiChildLayout(
      delegate: EditorCanvasLayoutDelegate(graph),
      children: [
        for (final node in graph.nodes)
          LayoutId(
            id: node.id,
            child: NodeWidget(node: node),
          ),
      ],
    );
  }
}

class EditorCanvasLayoutDelegate extends MultiChildLayoutDelegate {
  final Graph graph;

  EditorCanvasLayoutDelegate(this.graph) : super();

  @override
  void performLayout(Size size) {
    for (final node in graph.nodes) {
      positionChild(node.id, Offset(node.xPosition, node.yPosition));
      layoutChild(
        node.id,
        const BoxConstraints(maxWidth: 100, maxHeight: 100),
      );
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    if (oldDelegate is! EditorCanvasLayoutDelegate) {
      return true;
    }
    return graph != oldDelegate.graph;
  }
}
