import 'package:flutter_test/flutter_test.dart';
import 'package:pathfinder/engine/model/graph/node_palette.dart';
import 'package:pathfinder/engine/model/graph/node_template.dart';
import 'package:pathfinder/ui/screens/editor/new_node_template/cubit/new_node_template_cubit.dart';
import 'package:pathfinder/ui/screens/editor/new_node_template/cubit/new_node_template_state.dart';
import 'package:bloc_test/bloc_test.dart';

part 'fixtures.dart';

void main() async {
  group("New Node Template Cubit Tests", () {
    blocTest(
      "updateName - emits ready with new name",
      seed: () => readyState,
      build: () => NewNodeTemplateCubit(),
      act: (sut) {
        sut.updateName("New name");
      },
      expect: () => [
        readyState.copyWith.values.template(name: "New name"),
      ],
    );

    blocTest(
      "addItem - emits ready with new template",
      seed: () => readyState,
      build: () => NewNodeTemplateCubit(),
      act: (sut) {
        sut.addItem("3", NodePaletteItem.text);
      },
      expect: () =>
          [readyState.copyWith.values(template: nodeTemplateWithNewItem)],
    );

    blocTest(
      "removeItem - emits ready with item dropped",
      seed: () => readyState,
      build: () => NewNodeTemplateCubit(),
      act: (sut) {
        sut.removeItem("2");
      },
      expect: () => [
        readyState.copyWith.values(template: nodeTemplateWithOutItem),
      ],
    );
  });
}
