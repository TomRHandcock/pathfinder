import 'package:get_it/get_it.dart';
import 'package:pathfinder/ui/screens/editor/canvas/cubit/canvas_cubit.dart';
import 'package:pathfinder/ui/screens/editor/cubit/editor_cubit.dart';
import 'package:pathfinder/ui/screens/editor/new_node_template/cubit/new_node_template_cubit.dart';
part 'cubit_setup.dart';
part 'use_case_setup.dart';
part 'repository_setup.dart';
part 'service_setup.dart';

final _getIt = GetIt.I;

Future<void> setupDependencies() async {
  await _setupServices();
  _setupRepositories();
  _setupUseCases();
  _setupCubits();
}