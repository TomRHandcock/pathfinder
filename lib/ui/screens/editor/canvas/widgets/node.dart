import 'package:flutter/material.dart';
import 'package:pathfinder/engine/model/graph/node.dart';

class NodeWidget extends StatelessWidget {
  final Node node;

  const NodeWidget({
    required this.node,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Colors.lightBlue,
        ),
        padding: const EdgeInsets.all(16),
        child: Text("Node ${node.id}: ${node.id}"),
      ),
    ]);
  }
}
