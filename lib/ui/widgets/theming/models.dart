import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';

@freezed
class PathfinderTheme with _$PathfinderTheme {
  const factory PathfinderTheme({
    required PathfinderColors colors,
    required PathfinderInput input,
    required PathfinderText text,
  }) = _PathfinderTheme;
}

@freezed
class PathfinderColors with _$PathfinderColors {
  const factory PathfinderColors({
    required Color backgroundColor,
    required Color surfaceColor,
    required Color primaryColor,
    required Color textColor,
    required Color rippleColor,
  }) = _PathfinderColors;
}

@freezed
class PathfinderText with _$PathfinderText {
  const factory PathfinderText({
    required TextStyle heading,
    required TextStyle bodyLarge,
    required TextStyle body,
  }) = _PathfinderText;
}

@freezed
class PathfinderInput with _$PathfinderInput {
  const factory PathfinderInput({
    required InputDecoration textfield,
  }) = _PathfinderInput;
}
