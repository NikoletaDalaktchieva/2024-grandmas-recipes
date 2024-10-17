import 'package:flutter/material.dart';
import 'package:project1/components/custom_button.dart';
import 'package:project1/components/custom_text.dart';
import 'package:project1/components/custom_text_field.dart';
import 'package:project1/components/header.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:project1/components/upload_image_button.dart';
import 'package:project1/constants/app_colors.dart';
import 'package:project1/constants/breakpoints.dart';
import 'package:get/get.dart';
import 'package:project1/controllers/recipe_controler.dart';
import 'package:project1/models/recipe.dart';

class AddRecipe extends StatelessWidget {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final recipeController = Get.find<RecipeController>();
  late Recipe recipe;

  AddRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    var id = Get.parameters["recipeId"];
    if (id == null) {
      recipe = Recipe.empty();
    } else {
      int recipeId = int.tryParse(Get.parameters["recipeId"]!) ?? -1;

      if (!recipeController.isExist(recipeId)) {
        return Text("404 recipe not found");
      }

      recipe = recipeController.get(recipeId);
    }

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
                      key: _fbKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            title(),
                            const SizedBox(height: 10),
                            subtitle(),
                            const SizedBox(height: 10),
                            image(size),
                            const SizedBox(height: 10),
                            mainInfo(),
                            const SizedBox(height: 10),
                            ingredients(),
                            const SizedBox(height: 10),
                            direction(),
                          ]),
                    ))))
      ]),
      floatingActionButton: footerButtons(context),
    );
  }

  Widget title() {
    return CustomTextField(
      initialValue: recipe.title,
      name: 'title',
      hintText: 'Title',
      fontSize: 24,
      requiredField: true,
      width: Breakpoints.tablet.toDouble(),
    );
  }

  Widget subtitle() {
    return CustomTextField(
      initialValue: recipe.subtitle,
      name: 'subtitle',
      hintText: 'Subtitle',
      maxLines: 3,
      requiredField: true,
      width: Breakpoints.tablet.toDouble(),
    );
  }

  Widget image(size) {
    return ImageUploadExample(recipe.imageUrl, size.height,
        onImageSelected: (imageUrl) => recipe.imageUrl = imageUrl!);
  }

  Widget mainInfo() {
    return Container(
      padding: const EdgeInsets.all(15.0),
      width: Breakpoints.tablet.toDouble(),
      decoration: const BoxDecoration(
        color: AppColors.elementColor,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              textFieldWithTitle("Preparation time", recipe.preparationTime),
              textFieldWithTitle("Cook time", recipe.cookTime),
              textFieldWithTitle("Total time", recipe.totalTime),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              textFieldWithTitle("Level", recipe.level),
              textFieldWithTitle("Servings", recipe.servings),
              textFieldWithTitle("Yield", recipe.yield),
            ],
          ),
        ],
      ),
    );
  }

  Widget textFieldWithTitle(String text, String? content) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CustomText(text),
      CustomTextField(
          initialValue: content,
          name: convertToSnakeCase(text),
          hintText: text,
          fontSize: 14,
          width: 140)
    ]);
  }

  String convertToSnakeCase(String input) {
    return input.toLowerCase().split(' ').join('_');
  }

  Widget ingredients() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const CustomText("Ingrediants", fontSize: 20),
      CustomTextField(
        initialValue: recipe.ingredients,
        name: 'ingredients',
        hintText: 'Enter your ingredients here',
        maxLines: 3,
        width: Breakpoints.tablet.toDouble(),
      ),
    ]);
  }

  Widget direction() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const CustomText("Direction", fontSize: 20),
      CustomTextField(
          initialValue: recipe.directions,
          name: 'directions',
          hintText: 'Enter the steps here',
          maxLines: 5,
          width: Breakpoints.tablet.toDouble())
    ]);
  }

  Widget footerButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomButton("Save", () => saveFunction()),
          const SizedBox(width: 10), // Space between buttons
          CustomButton("Cancel", () => cancelFunction(context)),
        ],
      ),
    );
  }

  saveFunction() {
    recipe.title = getKey('title');
    recipe.subtitle = getKey("subtitle");
    recipe.preparationTime = getKey("preparation_time");
    recipe.cookTime = getKey("cook_time");
    recipe.totalTime = getKey("total_time");
    recipe.level = getKey("level");
    recipe.servings = getKey("servings");
    recipe.yield = getKey("yield");
    recipe.ingredients = getKey("ingredients");
    recipe.directions = getKey("directions");

    recipeController
        .update(recipe); // create news if recipe with the id is not founded
    Get.toNamed("/");
  }

  getKey(String key) {
    return _fbKey.currentState?.fields[key]?.value;
  }

  cancelFunction(BuildContext context) {
    _showConfirmationDialog(context);
  }

  Future<void> _showConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Confirm'),
          content: const Text('Do you want to proceed?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              child: const Text('Confirm'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}
