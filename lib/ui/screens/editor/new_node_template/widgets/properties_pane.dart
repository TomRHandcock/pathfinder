part of '../new_node_template_screen.dart';

class NewNodeTemplatePropertiesPane extends StatefulWidget {
  final NodeTemplate template;
  final Function(String id)? onItemDeleted;

  const NewNodeTemplatePropertiesPane({
    super.key,
    required this.template,
    this.onItemDeleted,
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
          Expanded(
              child: _LayersPane(
            template: widget.template,
            onDeletePressed: (id) => widget.onItemDeleted?.call(id),
          )),
          const PathfinderFilledButton(label: "Create")
        ],
      ),
    );
  }
}

class _LayersPane extends StatelessWidget {
  final NodeTemplate template;
  final Function(String id)? onDeletePressed;

  const _LayersPane({
    required this.template,
    this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    final items = template.item.getFlatChildren();
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (_, int index) {
        final item = items[index];
        return _LayerItem(
          item: item.$1,
          depth: item.$2,
          onDeletePressed: () => onDeletePressed?.call(item.$1.id),
        );
      },
      separatorBuilder: (_, __) => const SizedBox.square(
        dimension: 4,
      ),
      itemCount: items.length,
    );
  }
}

class _LayerItem extends StatelessWidget {
  final int depth;
  final NodeItem item;
  final Function()? onDeletePressed;

  const _LayerItem({
    required this.item,
    required this.depth,
    this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 12.0 * depth),
        Expanded(
          child: Text(
            item.name,
            style: context.pathfinderTheme.text.bodyLarge,
          ),
        ),
        IconButton(
          onPressed: () => onDeletePressed?.call(),
          icon: const Icon(Icons.delete),
        )
      ],
    );
  }
}
