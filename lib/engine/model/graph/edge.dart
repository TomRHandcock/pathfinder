import 'package:freezed_annotation/freezed_annotation.dart';

part 'edge.freezed.dart';

@freezed
class Edge with _$Edge {
  const factory Edge({
    required int startId,
    required int endId,
  }) = _Edge;
}
