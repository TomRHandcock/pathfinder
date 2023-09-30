import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pathfinder/engine/model/graph/graph.dart';

part 'canvas_state.freezed.dart';

@freezed
class CanvasState with _$CanvasState {
  const factory CanvasState({
    required Graph graph,
  }) = _CanvasState;
}
