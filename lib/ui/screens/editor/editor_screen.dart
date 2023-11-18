import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pathfinder/ui/screens/editor/widgets/node_palette.dart';
import 'package:pathfinder/ui/widgets/router/main_router.dart';

@RoutePage()
class EditorScreen extends StatefulWidget {
  const EditorScreen({super.key});

  @override
  State<EditorScreen> createState() => _EditorScreenState();

  _onNewNodeTemplatePressed(BuildContext context) {
    AutoRouter.of(context).push(const NewNodeTemplateRoute());
  }
}

class _EditorScreenState extends State<EditorScreen> {
  @override
  Widget build(BuildContext context) {
    return _EditorContent(
      onNewNodeTemplatePressed: () => widget._onNewNodeTemplatePressed(context),
    );
  }
}

class _EditorContent extends StatelessWidget {
  final Function()? onNewNodeTemplatePressed;

  const _EditorContent({
    this.onNewNodeTemplatePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: 125,
            child: NodePalette(
              onNewNodeTemplatePressed: () => onNewNodeTemplatePressed?.call(),
            ),
          ),
          const Expanded(
            child: AutoRouter(),
          ),
        ],
      ),
    );
  }
}
