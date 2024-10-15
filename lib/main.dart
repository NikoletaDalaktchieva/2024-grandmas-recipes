import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project1/controllers/recipe_controler.dart';
import 'package:project1/pages/add_recipe.dart';
import 'package:project1/pages/main_screen.dart';
import 'package:get/get.dart';

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox("storage");
  Get.lazyPut<RecipeController>(() => RecipeController());
  runApp(
    GetMaterialApp(
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => MainScreen()),
        GetPage(name: "/add_recipe", page: () => AddRecipe()),
      ],
    ),
  );
}
