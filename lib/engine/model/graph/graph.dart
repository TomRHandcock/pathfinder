import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pathfinder/engine/model/graph/edge.dart';
import 'package:pathfinder/engine/model/graph/node.dart';

part 'graph.freezed.dart';

@freezed
class Graph with _$Graph {
  const factory Graph({
    required List<Node> nodes,
    required List<Edge> edges,
  }) = _Graph;
}
