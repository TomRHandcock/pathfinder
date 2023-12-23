part of '../new_node_template_screen.dart';

class NewNodeTemplatePropertiesPane extends StatefulWidget {
  final NodeTemplate template;

  const NewNodeTemplatePropertiesPane({
    super.key,
    required this.template,
  });

  @override
  State<NewNodeTemplatePropertiesPane> createState() =>
      _NewNodeTemplatePropertiesPaneState();
}

class _NewNodeTemplatePropertiesPaneState
    extends State<NewNodeTemplatePropertiesPane> {
  late final TextEditingController _nameController;

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.template.name);
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.pathfinderTheme.colors.backgroundColor,
      padding: const EdgeInsets.all(8),
      width: 300,
      child: Column(
        children: [
          PathfinderTextField(
            controller: _nameController,
          ),
          Expanded(child: Container()),
          const PathfinderFilledButton(label: "Create")
        ],
      ),
    );
  }
}
