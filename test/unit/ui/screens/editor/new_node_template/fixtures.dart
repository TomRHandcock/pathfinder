part of 'new_node_template_cubit_test.dart';

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
        child: NodeItem.text(id: "4", fontSize: 16.0, inputKey: "text-4"),
      ),
    ],
  ),
);

const nodeTemplateWithOutItem = NodeTemplate(
  name: "My template",
  item: NodeItem.column(
    id: "0",
    children: [
      NodeItem.text(id: "1", fontSize: 12.0, inputKey: "text-1"),
      NodeItem.container(id: "3"),
    ],
  ),
);

const newItem = NodeItem.text(id: "4", inputKey: "text-4", fontSize: 11.0);

const readyState = NewNodeTemplateState.ready(
  values: NewNodeTemplateValues(
    template: nodeTemplate,
  ),
);
