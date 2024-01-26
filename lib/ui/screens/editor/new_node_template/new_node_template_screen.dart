import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:pathfinder/engine/model/graph/node_palette.dart';
import 'package:pathfinder/engine/model/graph/node_template.dart';
import 'package:pathfinder/ui/screens/editor/new_node_template/cubit/new_node_template_cubit.dart';
import 'package:pathfinder/ui/screens/editor/new_node_template/cubit/new_node_template_state.dart';
import 'package:pathfinder/ui/screens/editor/new_node_template/widgets/item_preview.dart';
import 'package:pathfinder/ui/util/context_utils.dart';
import 'package:pathfinder/ui/widgets/buttons/pathinder_filled_button.dart';
import 'package:pathfinder/ui/widgets/input/pathfinder_text_field.dart';
import 'package:pathfinder/ui/widgets/theming/models.dart';

part 'widgets/item_palette.dart';

part 'widgets/properties_pane.dart';

@RoutePage()
class NewNodeTemplateScreen extends StatelessWidget
    implements AutoRouteWrapper {
  const NewNodeTemplateScreen({super.key});

  _onNameUpdated(BuildContext context, String name) {
    context.read<NewNodeTemplateCubit>().updateName(name);
  }

  _onItemAdded(BuildContext context, String parentId, NodePaletteItem item) {
    context.read<NewNodeTemplateCubit>().addItem(parentId, item);
  }

  _onItemRemoved(BuildContext context, String id) {
    context.read<NewNodeTemplateCubit>().removeItem(id);
  }

  _onCreate(BuildContext context) {
    final template = context.read<NewNodeTemplateCubit>().state.values.template;
    AutoRouter.of(context).pop(template);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewNodeTemplateCubit, NewNodeTemplateState>(
      builder: (BuildContext context, NewNodeTemplateState state) =>
          NewNodeTemplateContent(
        onNameUpdated: (String name) => _onNameUpdated(context, name),
        onItemAdded: (String parentId, NodePaletteItem item) =>
            _onItemAdded(context, parentId, item),
        onItemRemoved: (String id) => _onItemRemoved(context, id),
        onCreate: () => _onCreate(context),
        state: state,
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (_) => GetIt.I.get<NewNodeTemplateCubit>(),
        child: this,
      );
}

class NewNodeTemplateContent extends StatelessWidget {
  final Function(String name)? onNameUpdated;
  final Function(String parentId, NodePaletteItem item)? onItemAdded;
  final Function(String id)? onItemRemoved;
  final Function()? onCreate;
  final NewNodeTemplateState state;

  const NewNodeTemplateContent({
    required this.state,
    this.onNameUpdated,
    this.onItemAdded,
    this.onItemRemoved,
    this.onCreate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(
          width: 125,
          child: ItemPalette(),
        ),
        Expanded(
          child: Container(
            height: double.infinity,
            color: context.pathfinderTheme.colors.surfaceColor,
            child: Center(
              child: ItemPreview(
                item: state.values.template.item,
                onItemAdded: onItemAdded,
              ),
            ),
          ),
        ),
        NewNodeTemplatePropertiesPane(
          template: state.values.template,
          onNameUpdated: onNameUpdated,
          onItemDeleted: (id) => onItemRemoved?.call(id),
          onCreate: onCreate,
        ),
      ],
    );
  }
}
