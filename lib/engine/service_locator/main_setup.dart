import 'package:get_it/get_it.dart';

part 'cubit_setup.dart';
part 'use_case_setup.dart';
part 'repository_setup.dart';
part 'service_setup.dart';

final _getIt = GetIt.I;

setupDependencies() async {
  _setupServices();
  _setupRepositories();
  _setupUseCases();
  _setupCubits();
}