import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';

@freezed
class PathfinderTheme with _$PathfinderTheme {
  const factory PathfinderTheme({
    required PathfinderColors colors,
    required PathfinderText text,
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

@freezed
class PathfinderText with _$PathfinderText {
  const factory PathfinderText({
    required TextStyle heading,
    required TextStyle body,
  }) = _PathfinderText;
}
