import 'package:freezed_annotation/freezed_annotation.dart';

part 'edge.freezed.dart';

@freezed
class Edge with _$Edge {
  const factory Edge({
    required int id,
    required int startNode,
    required double startSide,
    required int endNode,
    required double endSide,
  }) = _Edge;
}
