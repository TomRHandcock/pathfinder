import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pathfinder/ui/screens/editor/cubit/editor_cubit.dart';
import 'package:pathfinder/ui/screens/editor/cubit/editor_state.dart';
import 'package:pathfinder/ui/screens/editor/widgets/editor_canvas.dart';
import 'package:pathfinder/ui/screens/editor/widgets/node_palette.dart';
import 'package:pathfinder/ui/screens/new_node_template/new_node_template_dialog.dart';
import 'package:pathfinder/ui/util/context_utils.dart';

@RoutePage()
class EditorScreen extends StatefulWidget implements AutoRouteWrapper {
  const EditorScreen({super.key});

  @override
  State<EditorScreen> createState() => _EditorScreenState();

  _onNewNodeTemplatePressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => const NewNodeTemplateDialog(),
    );
  }

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
        return _EditorContent(
          state: state,
          onNewNodeTemplatePressed: () =>
              widget._onNewNodeTemplatePressed(context),
        );
      },
    );
  }
}

class _EditorContent extends StatelessWidget {
  final EditorState state;
  final Function()? onNewNodeTemplatePressed;

  const _EditorContent({
    required this.state,
    this.onNewNodeTemplatePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 100,
            child: NodePalette(
              onNewNodeTemplatePressed: () => onNewNodeTemplatePressed?.call(),
            ),
          ),
          Expanded(
            child: ColoredBox(
              color: context.pathfinderTheme.colors.surfaceColor,
              child: EditorCanvas(
                graph: state.graph,
                controller: GraphController(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
