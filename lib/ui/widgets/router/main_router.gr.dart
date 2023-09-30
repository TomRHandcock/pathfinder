// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'main_router.dart';

abstract class _$MainRouter extends RootStackRouter {
  // ignore: unused_element
  _$MainRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CanvasRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const CanvasScreen()),
      );
    },
    EditorRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EditorScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    NewNodeTemplateRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const NewNodeTemplateScreen()),
      );
    },
  };
}

/// generated route for
/// [CanvasScreen]
class CanvasRoute extends PageRouteInfo<void> {
  const CanvasRoute({List<PageRouteInfo>? children})
      : super(
          CanvasRoute.name,
          initialChildren: children,
        );

  static const String name = 'CanvasRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditorScreen]
class EditorRoute extends PageRouteInfo<void> {
  const EditorRoute({List<PageRouteInfo>? children})
      : super(
          EditorRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditorRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewNodeTemplateScreen]
class NewNodeTemplateRoute extends PageRouteInfo<void> {
  const NewNodeTemplateRoute({List<PageRouteInfo>? children})
      : super(
          NewNodeTemplateRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewNodeTemplateRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
