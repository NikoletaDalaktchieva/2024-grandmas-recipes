import 'package:flutter/material.dart';
import 'package:project1/components/custom_text.dart';
import 'package:project1/components/header.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:project1/constants/app_colors.dart';
import 'package:project1/constants/breakpoints.dart';
import 'package:get/get.dart';
import 'package:project1/controllers/recipe_controler.dart';
import 'package:project1/models/recipe.dart';

class RecipeInfo extends StatelessWidget {
  final recipeController = Get.find<RecipeController>();
  late Recipe recipe;

  RecipeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    int recipeId = int.tryParse(Get.parameters["recipeId"]!) ?? -1;

    if (!recipeController.isExist(recipeId)) {
      return Text("404 recipe not found");
    }
    recipe = recipeController.get(recipeId);

    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(children: [
        Header(size.width),
        const SizedBox(height: 5),
        Expanded(
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FormBuilder(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(recipe.title, fontSize: 24, bold: true),
                            const SizedBox(height: 10),
                            CustomText(recipe.subtitle, italic: true),
                            const SizedBox(height: 10),
                            image(size),
                            const SizedBox(height: 10),
                            mainInfo(),
                            if (recipe.ingredients != null) ingredients(),
                            if (recipe.directions != null) direction(),
                          ]),
                    ))))
      ]),
    );
  }

  Widget image(size) {
    if (recipe.imageUrl.isEmpty) return SizedBox.shrink();
    return Container(
      width: Breakpoints.tablet.toDouble(),
      height: size.height / 3,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(recipe.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget mainInfo() {
    if (isMainInfoEmpty()) {
      return SizedBox(
        width: Breakpoints.tablet.toDouble(),
      );
    }
    return Container(
      padding: const EdgeInsets.all(15.0),
      width: Breakpoints.tablet.toDouble(),
      decoration: const BoxDecoration(
        color: AppColors.elementColor,
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 70),
              textFieldWithTitle("Preparation time", recipe.preparationTime),
              textFieldWithTitle("Cook time", recipe.cookTime),
              textFieldWithTitle("Total time", recipe.totalTime),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 70),
              textFieldWithTitle("Level", recipe.level),
              textFieldWithTitle("Servings", recipe.servings),
              textFieldWithTitle("Yield", recipe.yield),
            ],
          ),
        ],
      ),
    );
  }

  bool isMainInfoEmpty() {
    return (recipe.preparationTime == null ||
            recipe.preparationTime!.isEmpty) &&
        (recipe.cookTime == null || recipe.cookTime!.isEmpty) &&
        (recipe.totalTime == null || recipe.totalTime!.isEmpty) &&
        (recipe.level == null || recipe.level!.isEmpty) &&
        (recipe.servings == null || recipe.servings!.isEmpty) &&
        (recipe.yield == null || recipe.yield!.isEmpty);
  }

  Widget textFieldWithTitle(String text, String? content) {
    if (content == null || content.isEmpty) {
      return SizedBox.shrink();
    }
    return Row(children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(width: 150, child: CustomText(text, bold: true)),
        CustomText(content, fontSize: 14)
      ]),
      SizedBox(width: 70)
    ]);
  }

  Widget ingredients() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: 10),
      const CustomText("Ingrediants", fontSize: 20, bold: true),
      CustomText(recipe.ingredients)
    ]);
  }

  Widget direction() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: 10),
      const CustomText("Direction", fontSize: 20, bold: true),
      CustomText(recipe.directions)
    ]);
  }
}
