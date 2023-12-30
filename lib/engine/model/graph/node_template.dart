import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pathfinder/engine/util/object_utils.dart';
import 'package:pathfinder/engine/util/iterable_utils.dart';

part 'node_template.freezed.dart';

@freezed
class NodeTemplate with _$NodeTemplate {
  const factory NodeTemplate({
    required String name,
    @Default(NodeItem.container(id: "0", child: null)) NodeItem item,
  }) = _NodeTemplate;
}

@freezed
sealed class NodeItem with _$NodeItem {
  const NodeItem._();

  const factory NodeItem.container({
    required String id,
    NodeItem? child,
  }) = NodeItemContainer;

  const factory NodeItem.text({
    required String id,
    required double fontSize,
    required String inputKey,
  }) = NodeItemText;

  const factory NodeItem.column({
    required String id,
    required List<NodeItem> children,
  }) = NodeItemColumn;

  const factory NodeItem.row({
    required String id,
    required List<NodeItem> children,
  }) = NodeItemRow;

  const factory NodeItem.image({
    required String id,
    required String inputKey,
  }) = NodeItemImage;

  String get name => switch (this) {
        NodeItemContainer() => "Container",
        NodeItemRow() => "Row",
        NodeItemColumn() => "Column",
        NodeItemText() => "Text",
        NodeItemImage() => "Image",
      };

  List<(NodeItem, int)> getFlatChildren([int depth = 0]) =>
      [(this, depth)] +
      switch (this) {
        NodeItemContainer(:final child) => [if (child != null) child],
        NodeItemColumn(:final children) ||
        NodeItemRow(:final children) =>
          children,
        _ => <NodeItem>[],
      }
          .map((item) => item.getFlatChildren(depth + 1))
          .flatten();

  List<String> get ids => switch (this) {
        NodeItemContainer(:final id, :final child) => [id] + (child?.ids ?? []),
        NodeItemText(:final id) => [id],
        NodeItemImage(:final id) => [id],
        NodeItemRow(:final id, :final children) =>
          children.fold([id], (acc, child) => acc + child.ids),
        NodeItemColumn(:final id, :final children) =>
          children.fold([id], (acc, child) => acc + child.ids),
      };

  List<String> get inputKeys => switch (this) {
        NodeItemContainer(:final child) => child?.inputKeys ?? [],
        NodeItemText(:final inputKey) => [inputKey],
        NodeItemImage(:final inputKey) => [inputKey],
        NodeItemColumn(:final children) =>
          children.fold([], (current, node) => current + node.inputKeys),
        NodeItemRow(:final children) =>
          children.fold([], (current, node) => current + node.inputKeys),
      };

  NodeItem addDescendant(String parentId, NodeItem descendant) {
    if (parentId == id) {
      return addChild(descendant);
    }
    return switch (this) {
      NodeItemColumn(:final children) => NodeItemColumn(
          id: id,
          children: children
              .map(
                (item) => item.addDescendant(parentId, descendant),
              )
              .toList(),
        ),
      NodeItemRow(:final children) => NodeItem.row(
          id: id,
          children: children
              .map(
                (child) => child.addDescendant(parentId, descendant),
              )
              .toList()),
      NodeItemContainer(:final id, :final child) => NodeItem.container(
          id: id,
          child: child?.addDescendant(parentId, descendant),
        ),
      _ => this,
    };
  }

  NodeItem addChild(NodeItem newChild) => switch (this) {
        NodeItemRow(:final id, :final children) => NodeItem.row(
            id: id,
            children: children + [newChild],
          ),
        NodeItemColumn(:final id, :final children) => NodeItem.column(
            id: id,
            children: children + [newChild],
          ),
        NodeItemContainer(:final id, :final child) => NodeItem.container(
            id: id,
            child: child ?? newChild,
          ),
        _ => throw StateError("Can't add child to node with ID: $id}"),
      };
}
