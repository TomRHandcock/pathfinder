import 'package:flutter/material.dart';
import 'package:pathfinder/ui/widgets/router/main_router.dart';

class App extends StatelessWidget {
  App({super.key});

  final _mainRouter = MainRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _mainRouter.config(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
