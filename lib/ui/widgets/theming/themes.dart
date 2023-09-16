import 'dart:ui';

import 'package:pathfinder/ui/widgets/theming/models.dart';

abstract class Themes {
  static const defaultTheme = PathfinderTheme(
    colors: PathfinderColors(
      backgroundColor: Color(0xff0c0c0c),
      surfaceColor: Color(0xff191919),
      primaryColor: Color(0xffefefef),
    ),
  );
}
