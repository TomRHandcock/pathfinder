import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'node.freezed.dart';

@freezed
class Node with _$Node {
  const factory Node({
    required int id,
    required Offset position,
    required String label,
  }) = _Node;
}
