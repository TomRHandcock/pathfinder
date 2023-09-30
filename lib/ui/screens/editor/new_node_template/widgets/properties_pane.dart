part of '../new_node_template_screen.dart';

class NewNodeTemplatePropertiesPane extends StatelessWidget {
  final NodeTemplate template;

  const NewNodeTemplatePropertiesPane({
    super.key,
    required this.template,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.pathfinderTheme.colors.backgroundColor,
      padding: const EdgeInsets.all(8),
      width: 300,
      child: Column(
        children: [
          const PathfinderTextField(),
          Expanded(child: Container()),
          const PathfinderFilledButton(label: "Create")
        ],
      ),
    );
  }
}
