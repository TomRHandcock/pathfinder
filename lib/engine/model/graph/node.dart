import 'package:freezed_annotation/freezed_annotation.dart';

part 'node.freezed.dart';

@freezed
class Node with _$Node {
  const factory Node({
    required int id,
    required double xPosition,
    required double yPosition,
    required String label,
  }) = _Node;
}
