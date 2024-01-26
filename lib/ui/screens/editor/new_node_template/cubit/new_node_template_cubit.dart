import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pathfinder/engine/model/graph/node_palette.dart';
import 'package:pathfinder/engine/model/graph/node_template.dart';

import 'new_node_template_state.dart';

class NewNodeTemplateCubit extends Cubit<NewNodeTemplateState> {
  NewNodeTemplateCubit()
      : super(
          const NewNodeTemplateState.ready(
            values: NewNodeTemplateValues(
              template: NodeTemplate(
                name: "Template",
                item: NodeItem.container(id: "0"),
              ),
            ),
          ),
        );

  updateName(String name) {
    emit(state.copyWith.values.template(name: name));
  }

  addItem(String parentId, NodePaletteItem item) {
    final currentTree = state.values.template.item;
    final newItem = createItem(item);
    if (currentTree == null) {
      emit(state.copyWith.values.template(item: newItem));
      return;
    }
    emit(
      state.copyWith.values.template(
        item: currentTree.addDescendant(parentId, newItem),
      ),
    );
  }

  NodeItem createItem(NodePaletteItem item) {
    final existingIds = state.values.template.item.ids;
    final newId = "${existingIds.length}";
    return item.toNodeItem(newId);
  }

  removeItem(String id) {
    final currentTree = state.values.template.item;
    emit(
      state.copyWith.values.template(
        item: currentTree.removeDescendant(id),
      ),
    );
  }
}
