import 'package:bloc/bloc.dart';
import 'package:pathfinder/engine/model/graph/graph.dart';
import 'package:pathfinder/engine/model/graph/node.dart';
import 'package:pathfinder/ui/screens/editor/cubit/editor_state.dart';

class EditorCubit extends Cubit<EditorState> {
  EditorCubit() : super(const EditorState(graph: Graph(nodes: [], edges: [])));

  addNode(Node node) {
    final currentNodes = state.graph.nodes;
    final newNodes = currentNodes + [node];
    emit(state.copyWith.graph(nodes: newNodes));
  }
}
