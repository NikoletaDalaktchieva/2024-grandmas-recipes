import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project1/controllers/recipe_controler.dart';
import 'package:project1/pages/add_recipe.dart';
import 'package:project1/pages/main_screen.dart';
import 'package:get/get.dart';
import 'package:project1/pages/recipe_info.dart';

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
        GetPage(name: "/edit_recipe/:recipeId", page: () => AddRecipe()),
        GetPage(name: "/recipe/:recipeId", page: () => RecipeInfo()),
      ],
    ),
  );
}

// TODO view screen
// TODO time fileds to be only with numbers
// TODO visualize bullet points
// TODO add numbers to the adress
// TODO deploy the app