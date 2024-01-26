import 'package:pathfinder/engine/model/graph/node_template.dart';

enum NodePaletteItem {
  container,
  row,
  column,
  text,
  image;

  String get icon => switch (this) {
        container => "assets/image/ic_container.svg",
        row => "assets/image/ic_row.svg",
        column => "assets/image/ic_column.svg",
        text => "assets/image/ic_text.svg",
        image => "assets/image/ic_image.svg",
      };

  NodeItem toNodeItem(String id) => switch (this) {
        NodePaletteItem.container => NodeItem.container(id: id),
        NodePaletteItem.row => NodeItem.row(id: id, children: []),
        NodePaletteItem.column => NodeItem.column(id: id, children: []),
        NodePaletteItem.text =>
          NodeItem.text(id: id, fontSize: 16, inputKey: "text-$id"),
        NodePaletteItem.image => NodeItem.image(id: id, inputKey: "text-$id"),
      };
}
