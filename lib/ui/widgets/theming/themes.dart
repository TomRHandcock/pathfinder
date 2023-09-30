import 'package:flutter/material.dart';
import 'package:pathfinder/ui/widgets/theming/models.dart';

abstract class Themes {
  static const defaultColors = PathfinderColors(
    backgroundColor: Color(0xff0c0c0c),
    surfaceColor: Color(0xff191919),
    primaryColor: Color(0xffefefef),
    rippleColor: Color(0xaaafafaf),
  );

  static final defaultText = PathfinderText(
    heading: TextStyle(
      color: defaultColors.primaryColor,
      fontSize: 28,
    ),
    body: TextStyle(
      color: defaultColors.primaryColor,
      fontSize: 14,
    ),
  );

  static final defaultTheme = PathfinderTheme(
    colors: defaultColors,
    text: defaultText,
  );
}
