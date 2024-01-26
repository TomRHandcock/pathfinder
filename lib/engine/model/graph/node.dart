import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pathfinder/engine/model/graph/node_template.dart';

part 'node.freezed.dart';

@freezed
class Node with _$Node {
  const factory Node({
    required int id,
    required Offset position,
    required Color background,
    required Map<String, String> values,
    required NodeTemplate template,
  }) = _Node;
}
