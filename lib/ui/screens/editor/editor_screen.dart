import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pathfinder/ui/screens/editor/cubit/editor_cubit.dart';
import 'package:pathfinder/ui/screens/editor/cubit/editor_state.dart';
import 'package:pathfinder/ui/screens/editor/widgets/editor_canvas.dart';
import 'package:pathfinder/ui/screens/editor/widgets/node_palette.dart';

@RoutePage()
class EditorScreen extends StatefulWidget implements AutoRouteWrapper {
  const EditorScreen({super.key});

  @override
  State<EditorScreen> createState() => _EditorScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider<EditorCubit>(
        create: (_) => GetIt.I.get(),
        child: this,
      );
}

class _EditorScreenState extends State<EditorScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditorCubit, EditorState>(
      builder: (BuildContext context, EditorState state) {
        return _EditorContent(state: state);
      },
    );
  }
}

class _EditorContent extends StatelessWidget {
  final EditorState state;

  const _EditorContent({required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const SizedBox(
            width: 100,
            child: NodePalette(),
          ),
          Expanded(
            child: EditorCanvas(
              graph: state.graph,
              controller: GraphController(),
            ),
          ),
        ],
      ),
    );
  }
}
