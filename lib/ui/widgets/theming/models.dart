import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';

@freezed
class PathfinderTheme with _$PathfinderTheme {
  const factory PathfinderTheme({
    required PathfinderColors colors,
  }) = _PathfinderTheme;
}

@freezed
class PathfinderColors with _$PathfinderColors {
  const factory PathfinderColors({
    required Color backgroundColor,
    required Color surfaceColor,
    required Color primaryColor,
    required Color rippleColor,
  }) = _PathfinderColors;
}
