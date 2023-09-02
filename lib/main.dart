import 'package:flutter/material.dart';
import 'package:pathfinder/engine/service_locator/main_setup.dart';
import 'package:pathfinder/ui/app.dart';

void main() async {
  await setupDependencies();
  runApp(App());
}