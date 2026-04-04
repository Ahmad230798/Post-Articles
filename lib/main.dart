import 'package:flutter/material.dart';
import 'package:flutter_project/core/DI/dependency_injection.dart';
import 'package:flutter_project/core/routing/app_route.dart';
import 'package:flutter_project/my_app.dart';

void main() {
  setupGitIt();
  runApp(MyApp(appRoute: AppRoute()));
}
