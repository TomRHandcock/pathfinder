import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pathfinder/engine/model/graph/graph.dart';
import 'package:pathfinder/ui/screens/editor/canvas/widgets/edge.dart';
import 'package:pathfinder/ui/screens/editor/canvas/widgets/node.dart';

class GraphController {
  List<SizedNode> nodeSizes = [];

  GraphController();
}

class EditorCanvas extends StatefulWidget {
  final Graph graph;
  final GraphController controller;

  const EditorCanvas(
      {required this.graph, required this.controller, super.key});

  @override
  State<EditorCanvas> createState() => _EditorCanvasState();
}

class _EditorCanvasState extends State<EditorCanvas> {
  late final delegate = EditorCanvasLayoutDelegate(
    widget.graph,
    (nodeSizes) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        setState(() {
          widget.controller.nodeSizes = nodeSizes;
        });
      });
    },
  );

  @override
  Widget build(BuildContext context) {
    return CustomMultiChildLayout(
      delegate: delegate,
      children: widget.graph.nodes
              .map(
                (node) => LayoutId(
                  id: "node-${node.id}",
                  child: NodeWidget(node: node),
                ),
              )
              .toList() +
          widget.graph.edges.map((edge) {
            return LayoutId(
              id: "edge-${edge.id}",
              child: widget.controller.nodeSizes.isNotEmpty
                  ? EdgeWidget(
                      edge: edge,
                      controller: widget.controller,
                    )
                  : Container(),
            );
          }).toList(),
    );
  }
}

class EditorCanvasLayoutDelegate extends MultiChildLayoutDelegate {
  final Graph graph;
  final Function(List<SizedNode> nodeSizes)? onLayout;

  EditorCanvasLayoutDelegate(
    this.graph,
    this.onLayout,
  ) : super();

  @override
  void performLayout(Size size) {
    final nodeSizes = graph.nodes.map((node) {
      positionChild("node-${node.id}", node.position);
      final size = layoutChild(
        "node-${node.id}",
        const BoxConstraints(),
      );
      return SizedNode(node, size);
    }).toList();
    onLayout?.call(nodeSizes);
    for (final edge in graph.edges) {
      positionChild(
        "edge-${edge.id}",
        Offset.zero,
      );
      layoutChild(
        "edge-${edge.id}",
        const BoxConstraints(),
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
