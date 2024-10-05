import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project1/components/header.dart';
import 'package:project1/pages/recipe_grid.dart';

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        scrollBehavior: CustomScrollBehavior(),
        home: Scaffold(
            body: Column(
          children: [
            Header(),
            Expanded(child: RecipeGrid()),
          ],
        )));
  }
}
