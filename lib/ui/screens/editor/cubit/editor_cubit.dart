import 'package:pathfinder/engine/model/graph/edge.dart';
import 'package:pathfinder/engine/model/graph/graph.dart';
import 'package:pathfinder/engine/model/graph/node.dart';
import 'package:pathfinder/ui/screens/editor/cubit/editor_state.dart';
import 'package:bloc/bloc.dart';

class EditorCubit extends Cubit<EditorState> {
  EditorCubit()
      : super(
          const EditorState(
            graph: Graph(
              nodes: [
                Node(id: 0, xPosition: 100, yPosition: 100, label: "Node 0"),
                Node(id: 1, xPosition: 100, yPosition: 200, label: "Node 1"),
              ],
              edges: [
                Edge(startId: 0, endId: 1),
              ],
            ),
          ),
        );
}