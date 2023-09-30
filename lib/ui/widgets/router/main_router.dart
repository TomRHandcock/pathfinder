import 'package:auto_route/auto_route.dart';
import 'package:pathfinder/ui/screens/editor/canvas/canvas_screen.dart';
import 'package:pathfinder/ui/screens/editor/new_node_template/new_node_template_screen.dart';
import 'package:pathfinder/ui/screens/editor/editor_screen.dart';
import 'package:pathfinder/ui/screens/home/home_screen.dart';

part 'main_router.gr.dart';

@AutoRouterConfig()
class MainRouter extends _$MainRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: EditorRoute.page,
          children: [
            AutoRoute(
              page: CanvasRoute.page,
              initial: true,
            ),
            AutoRoute(
              page: NewNodeTemplateRoute.page,
            ),
          ],
        ),
      ];
}
