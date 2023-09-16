import 'package:freezed_annotation/freezed_annotation.dart';

part 'node_template.freezed.dart';

@freezed
class NodeTemplate with _$NodeTemplate {
  const factory NodeTemplate({
    required String name,
    required NodeItem? item,
  }) = _NodeTemplate;
}

@freezed
sealed class NodeItem with _$NodeItem {
  const NodeItem._();

  const factory NodeItem.text({
    required String id,
    required int fontSize,
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

  List<String> get inputKeys => switch (this) {
    NodeItemText(:final inputKey) => [inputKey],
    NodeItemColumn(:final children) =>
        children.fold([], (current, node) => current + node.inputKeys),
    NodeItemRow(:final children) =>
        children.fold([], (current, node) => current + node.inputKeys),
  };
}