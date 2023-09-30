import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pathfinder/ui/screens/editor/canvas/cubit/canvas_cubit.dart';
import 'package:pathfinder/ui/screens/editor/canvas/cubit/canvas_state.dart';
import 'package:pathfinder/ui/screens/editor/canvas/widgets/editor_canvas.dart';
import 'package:pathfinder/ui/util/context_utils.dart';

@RoutePage()
class CanvasScreen extends StatelessWidget implements AutoRouteWrapper {
  const CanvasScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CanvasCubit, CanvasState>(builder: (context, state) {
      return CanvasContent(state: state);
    });
  }

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider<CanvasCubit>(
        create: (_) => GetIt.I.get(),
        child: this,
      );
}

class CanvasContent extends StatelessWidget {
  final CanvasState state;

  const CanvasContent({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.pathfinderTheme.colors.surfaceColor,
      child: EditorCanvas(
        graph: state.graph,
        controller: GraphController(),
      ),
    );
  }
}
