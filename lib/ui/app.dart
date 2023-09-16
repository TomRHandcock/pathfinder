import 'package:flutter/material.dart';
import 'package:pathfinder/ui/widgets/router/main_router.dart';
import 'package:pathfinder/ui/widgets/theming/theme_provider.dart';
import 'package:pathfinder/ui/widgets/theming/themes.dart';

class App extends StatelessWidget {
  App({super.key});

  final _mainRouter = MainRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _mainRouter.config(),
      builder: (BuildContext context, Widget? child) => PathfinderThemeProvider(
        theme: Themes.defaultTheme,
        child: child ?? Container(),
      ),
    );
  }
}
