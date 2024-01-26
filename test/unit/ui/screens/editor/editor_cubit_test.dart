import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pathfinder/engine/model/graph/node_template.dart';
import 'package:pathfinder/ui/screens/editor/cubit/editor_cubit.dart';
import 'package:pathfinder/ui/screens/editor/cubit/editor_state.dart';

part 'fixtures.dart';

void main() async {
  group("Editor cubit unit tests", () {
    blocTest(
      "addTemplate - emits state with additional template",
      build: () => EditorCubit(),
      act: (sut) {
        sut.addTemplate(_nodeTemplateFixture);
      },
      expect: () => [
        const EditorState(templates: [_nodeTemplateFixture]),
      ],
    );
  });
}
