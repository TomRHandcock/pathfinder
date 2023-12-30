part of 'node_template_test.dart';

const nodeTemplate = NodeTemplate(
  name: "My template",
  item: NodeItem.column(
    id: "0",
    children: [
      NodeItem.text(id: "1", fontSize: 12.0, inputKey: "text-1"),
      NodeItem.image(id: "2", inputKey: "image-2"),
      NodeItem.container(id: "3"),
    ],
  ),
);

const nodeTemplateWithNewItem = NodeTemplate(
  name: "My template",
  item: NodeItem.column(
    id: "0",
    children: [
      NodeItem.text(id: "1", fontSize: 12.0, inputKey: "text-1"),
      NodeItem.image(id: "2", inputKey: "image-2"),
      NodeItem.container(
        id: "3",
        child: NodeItem.text(id: "4", fontSize: 11.0, inputKey: "text-4"),
      ),
    ],
  ),
);

final flatNodeTemplate = [
  (nodeTemplate.item, 0),
  const (NodeItem.text(id: "1", fontSize: 12.0, inputKey: "text-1"), 1),
  const (NodeItem.image(id: "2", inputKey: "image-2"), 1),
  const (NodeItem.container(id: "3"), 1),
];
