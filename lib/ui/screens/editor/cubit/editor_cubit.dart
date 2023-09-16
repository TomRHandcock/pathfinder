import 'dart:ui';

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
                Node(id: 0, position: Offset(100, 100), label: "Node 0"),
                Node(id: 1, position: Offset(100, 200), label: "Node 1"),
              ],
              edges: [
                Edge(id: 0, startId: 0, startSide: 0.5, endId: 1, endSide: 0.5),
              ],
            ),
          ),
        );
}