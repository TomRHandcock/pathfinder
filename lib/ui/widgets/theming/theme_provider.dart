import 'package:flutter/widgets.dart';
import 'package:pathfinder/ui/widgets/theming/models.dart';
import 'package:provider/provider.dart';

class PathfinderThemeProvider extends StatelessWidget {
  final PathfinderTheme theme;
  final Widget child;

  const PathfinderThemeProvider({
    required this.theme,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Provider<PathfinderTheme>.value(
      value: theme,
      child: child,
    );
  }
}
