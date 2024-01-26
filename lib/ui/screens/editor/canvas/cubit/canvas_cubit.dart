import 'package:bloc/bloc.dart';
import 'package:pathfinder/engine/model/graph/graph.dart';
import 'package:pathfinder/engine/model/graph/node.dart';
import 'package:pathfinder/ui/screens/editor/canvas/cubit/canvas_state.dart';

class CanvasCubit extends Cubit<CanvasState> {
  CanvasCubit() : super(const CanvasState(graph: Graph(nodes: [], edges: [])));

  addNode(Node node) {
    final currentNodes = state.graph.nodes;
    final newNodes = currentNodes + [node];
    emit(state.copyWith.graph(nodes: newNodes));
  }
}
