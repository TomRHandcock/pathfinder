import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pathfinder/engine/model/graph/node_template.dart';

part 'editor_state.freezed.dart';

@freezed
class EditorState with _$EditorState {
  const factory EditorState({
    @Default([]) List<NodeTemplate> templates,
  }) = _EditorState;
}
