import 'package:flutter/widgets.dart';
import 'package:pathfinder/ui/widgets/theming/models.dart';
import 'package:provider/provider.dart';

extension ContextUtils on BuildContext {
  PathfinderTheme get pathfinderTheme => read<PathfinderTheme>();
}