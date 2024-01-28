import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pathfinder/engine/model/graph/node.dart';
import 'package:pathfinder/engine/model/graph/node_template.dart';
import 'package:pathfinder/engine/util/object_utils.dart';

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
        child: _NodeWidgetDelegate(
          item: node.template.item,
          inputs: node.inputs,
        ),
      ),
    ]);
  }
}

class _NodeWidgetDelegate extends StatelessWidget {
  final NodeItem item;
  final Map<String, dynamic> inputs;

  const _NodeWidgetDelegate({
    required this.item,
    required this.inputs,
  });

  @override
  Widget build(BuildContext context) {
    return switch (item) {
      NodeItemContainer() => _Container(
          item: item as NodeItemContainer,
          inputs: inputs,
        ),
      NodeItemColumn() => _Column(item: item as NodeItemColumn, inputs: inputs),
      NodeItemRow() => _Row(item: item as NodeItemRow, inputs: inputs),
      NodeItemText() => _Text(item: item as NodeItemText, inputs: inputs),
      NodeItemImage() => _Image(item: item as NodeItemImage, inputs: inputs),
    };
  }
}

class _Container extends StatelessWidget {
  final NodeItemContainer item;
  final Map<String, dynamic> inputs;

  const _Container({
    required this.item,
    required this.inputs,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: item.child?.let(
        (child) => _NodeWidgetDelegate(
          item: child,
          inputs: inputs,
        ),
      ),
    );
  }
}

class _Row extends StatelessWidget {
  final NodeItemRow item;
  final Map<String, dynamic> inputs;

  const _Row({
    required this.item,
    required this.inputs,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: item.children
          .map(
            (child) => _NodeWidgetDelegate(
              item: child,
              inputs: inputs,
            ),
          )
          .toList(),
    );
  }
}

class _Column extends StatelessWidget {
  final NodeItemColumn item;
  final Map<String, dynamic> inputs;

  const _Column({
    required this.item,
    required this.inputs,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: item.children
          .map(
            (child) => _NodeWidgetDelegate(
              item: child,
              inputs: inputs,
            ),
          )
          .toList(),
    );
  }
}

class _Text extends StatelessWidget {
  final NodeItemText item;
  final Map<String, dynamic> inputs;

  const _Text({
    required this.item,
    required this.inputs,
  });

  @override
  Widget build(BuildContext context) {
    return Text(inputs[item.inputKey] ?? "");
  }
}

class _Image extends StatelessWidget {
  final NodeItemImage item;
  final Map<String, dynamic> inputs;

  const _Image({
    required this.item,
    required this.inputs,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "assets/images/ic_image.svg",
      width: 200,
      height: 200,
    );
  }
}
