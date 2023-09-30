import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pathfinder/engine/model/graph/node_template.dart';

import 'new_node_template_state.dart';

class NewNodeTemplateCubit extends Cubit<NewNodeTemplateState> {
  NewNodeTemplateCubit()
      : super(
          const NewNodeTemplateState.ready(
            values: NewNodeTemplateValues(
              template: NodeTemplate(
                name: "Template",
                item: NodeItem.column(
                  id: "column",
                  children: [
                    NodeItem.text(id: "text", fontSize: 16, inputKey: "name"),
                  ],
                ),
              ),
            ),
          ),
        );

  addItem(String parentId, NodeItem item) {
    final currentTree = state.values.template.item;
    if (currentTree == null) {
      emit(state.copyWith.values.template(item: item));
      return;
    }
    emit(state.copyWith.values
        .template(item: _addItem(currentTree, parentId, item)));
  }

  NodeItem _addItem(NodeItem tree, String parentId, NodeItem newItem) {
    if (tree.id == parentId) {
      return switch (tree) {
        NodeItemRow(:final id, :final children) =>
          NodeItemRow(id: id, children: children + [newItem]),
        NodeItemColumn(:final id, :final children) =>
          NodeItemColumn(id: id, children: children + [newItem]),
        _ =>
          throw StateError("Can't add child to node item with ID: $parentId"),
      };
    }
    return switch (tree) {
      NodeItemColumn(:final id, :final children) => NodeItemColumn(
          id: id,
          children: children
              .map(
                (item) => _addItem(item, parentId, newItem),
              )
              .toList(),
        ),
      NodeItemRow(:final id, :final children) => NodeItemRow(
          id: id,
          children: children
              .map(
                (item) => _addItem(item, parentId, newItem),
              )
              .toList(),
        ),
      _ => tree,
    };
  }
}
