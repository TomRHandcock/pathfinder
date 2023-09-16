import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pathfinder/engine/model/graph/graph.dart';

part 'editor_state.freezed.dart';

@freezed
class EditorState with _$EditorState {
  const factory EditorState({
    required Graph graph,
  }) = _EditorState;
}
