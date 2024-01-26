import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pathfinder/engine/model/graph/node_template.dart';
import 'package:pathfinder/ui/screens/editor/cubit/editor_state.dart';

class EditorCubit extends Cubit<EditorState> {
  EditorCubit() : super(const EditorState());

  addTemplate(NodeTemplate template) {
    final currentTemplates = state.templates;
    emit(
      state.copyWith(templates: currentTemplates + [template]),
    );
  }
}
