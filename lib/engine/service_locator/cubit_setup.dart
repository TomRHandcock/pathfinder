part of 'main_setup.dart';

_setupCubits() {
  _getIt.registerFactory(() => EditorCubit());
  _getIt.registerFactory(() => CanvasCubit());
  _getIt.registerFactory(() => NewNodeTemplateCubit());
}
