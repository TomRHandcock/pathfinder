import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pathfinder/ui/widgets/router/main_router.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _onOpenEditorPressed(BuildContext context) {
    AutoRouter.of(context).push(const EditorRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Pathfinder"),
      ),
      body: Center(
        child: FilledButton(
          onPressed: () => _onOpenEditorPressed(context),
          child: const Text(
            "Open editor",
          ),
        ),
      ),
    );
  }
}
