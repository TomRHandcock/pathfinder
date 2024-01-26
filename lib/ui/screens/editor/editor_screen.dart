import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pathfinder/engine/model/graph/node_template.dart';
import 'package:pathfinder/engine/util/object_utils.dart';
import 'package:pathfinder/ui/screens/editor/canvas/cubit/canvas_cubit.dart';
import 'package:pathfinder/ui/screens/editor/cubit/editor_cubit.dart';
import 'package:pathfinder/ui/screens/editor/cubit/editor_state.dart';
import 'package:pathfinder/ui/screens/editor/widgets/node_palette.dart';
import 'package:pathfinder/ui/widgets/router/main_router.dart';

@RoutePage()
class EditorScreen extends StatefulWidget {
  const EditorScreen({super.key});

  @override
  State<EditorScreen> createState() => _EditorScreenState();

  _onNewNodeTemplatePressed(BuildContext context) {
    AutoRouter.of(context)
        .push(const NewNodeTemplateRoute())
        .then((maybeTemplate) {
      maybeTemplate.asOrNull<NodeTemplate>()?.let((template) {
        context.read<EditorCubit>().addTemplate(template);
      });
    });
  }
}

class _EditorScreenState extends State<EditorScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditorCubit>(
      create: (_) => GetIt.I.get(),
      child: BlocBuilder<EditorCubit, EditorState>(
        builder: (context, state) => _EditorContent(
          state: state,
          onNewNodeTemplatePressed: () =>
              widget._onNewNodeTemplatePressed(context),
        ),
      ),
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
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: 125,
            child: NodePalette(
              templates: state.templates,
              onNewNodeTemplatePressed: () => onNewNodeTemplatePressed?.call(),
            ),
          ),
          const Expanded(
            child: AutoRouter(),
          ),
        ],
      ),
    );
  }
}
