import 'package:flutter/material.dart';
import 'package:pathfinder/ui/widgets/theming/models.dart';

abstract class Themes {
  static const defaultColors = PathfinderColors(
    backgroundColor: Color(0xff0c0c0c),
    surfaceColor: Color(0xff191919),
    primaryColor: Color(0xff8803a0),
    textColor: Color(0xffefefef),
    rippleColor: Color(0xaaafafaf),
  );

  static final defaultInput = PathfinderInput(
    textfield: InputDecoration(

      border: UnderlineInputBorder(
        borderSide: BorderSide(
          color: defaultColors.textColor,
          width: 1,
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: defaultColors.textColor,
          width: 1,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: defaultColors.primaryColor,
        ),
      ),
    ),
  );

  static final defaultText = PathfinderText(
    heading: TextStyle(
      color: defaultColors.textColor,
      fontSize: 28,
    ),
    bodyLarge: TextStyle(
      color: defaultColors.textColor,
      fontSize: 18,
    ),
    body: TextStyle(
      color: defaultColors.textColor,
      fontSize: 14,
    ),
  );

  static final defaultTheme = PathfinderTheme(
    colors: defaultColors,
    input: defaultInput,
    text: defaultText,
  );
}
