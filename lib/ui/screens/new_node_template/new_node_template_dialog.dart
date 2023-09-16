import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pathfinder/engine/model/graph/node_template.dart';
import 'package:pathfinder/ui/screens/new_node_template/cubit/new_node_template_cubit.dart';
import 'package:pathfinder/ui/util/context_utils.dart';

class NewNodeTemplateDialog extends StatelessWidget {
  const NewNodeTemplateDialog({super.key});

  _onItemAdded(BuildContext context, String parentId, NodeItem item) {
    context.read<NewNodeTemplateCubit>().addItem(parentId, item);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<NewNodeTemplateCubit>(),
      child: NewNodeTemplateDialogContent(
        onItemAdded: (String parentId, NodeItem item) =>
            _onItemAdded(context, parentId, item),
      ),
    );
  }
}

class NewNodeTemplateDialogContent extends StatelessWidget {
  final Function(String parentId, NodeItem item)? onItemAdded;

  const NewNodeTemplateDialogContent({this.onItemAdded, super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: context.pathfinderTheme.colors.surfaceColor,
      title: const Text("New Node Template"),
    );
  }
}
