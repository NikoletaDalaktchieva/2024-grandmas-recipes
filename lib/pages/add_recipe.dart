import 'package:flutter/material.dart';
import 'package:project1/components/header.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:project1/constants/app_colors.dart';
import 'package:project1/constants/breakpoints.dart';
import 'package:get/get.dart';
import 'package:project1/controllers/recipe_controler.dart';
import 'package:project1/models/recipe.dart';

class AddRecipe extends StatelessWidget {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final recipeController = Get.find<RecipeController>();

  AddRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    print(recipeController.size);
    for (int i = 0; i < recipeController.size; i++) {
      print(recipeController.recipes[i].toString());
    }

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
                              direction()
                            ])))))
      ]),
      floatingActionButton: footerButtons(context),
    );
  }

  Widget title() {
    return SizedBox(
        width: Breakpoints.tablet.toDouble(),
        child: FormBuilderTextField(
          name: 'title',
          decoration: const InputDecoration(
            hintText: 'Title',
            border: OutlineInputBorder(),
          ),
          style: const TextStyle(
            fontSize: 24,
            color: AppColors.textColor,
          ),
        ));
  }

  Widget subtitle() {
    return SizedBox(
        width: Breakpoints.tablet.toDouble(),
        child: FormBuilderTextField(
          name: 'subtitle',
          decoration: const InputDecoration(
            hintText: 'Subtitle',
            border: OutlineInputBorder(),
          ),
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.textColor,
          ),
        ));
  }

  Widget image(size) {
    return Container(
      width: Breakpoints.tablet.toDouble(),
      height: size.height / 3,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/hamburger_recipe.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
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
              textFieldWithTitle("Preparation time"),
              textFieldWithTitle("Cook time"),
              textFieldWithTitle("Total time"),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              textFieldWithTitle("Level"),
              textFieldWithTitle("Servings"),
              textFieldWithTitle("Yield"),
            ],
          ),
        ],
      ),
    );
  }

  Widget textFieldWithTitle(String text) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.textColor,
        ),
      ),
      SizedBox(
          width: 120,
          child: FormBuilderTextField(
              name: convertToSnakeCase(text),
              decoration: InputDecoration(
                hintText: text,
                border: const OutlineInputBorder(),
              ),
              style: const TextStyle(
                fontSize: 14,
                //color: AppColors.textColor,
              )))
    ]);
  }

  String convertToSnakeCase(String input) {
    return input.toLowerCase().split(' ').join('_');
  }

  Widget ingredients() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(
        "Ingrediants",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.textColor,
          fontSize: 20,
        ),
      ),
      SizedBox(
          width: Breakpoints.tablet.toDouble(),
          child: FormBuilderTextField(
            name: 'ingredients',
            minLines: 3,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(
                  color: AppColors.textColor,
                  width: 1.0,
                ),
              ),
              hintText: 'Enter your ingredients here',
            ),
          ))
    ]);
  }

  Widget direction() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(
        "Direction",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.textColor,
          fontSize: 20,
        ),
      ),
      SizedBox(
          width: Breakpoints.tablet.toDouble(),
          child: FormBuilderTextField(
            name: 'directions',
            minLines: 5,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(
                  color: AppColors.textColor,
                  width: 1.0,
                ),
              ),
              hintText: 'Enter the steps here',
            ),
          ))
    ]);
  }

  Widget footerButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          saveButton(),
          const SizedBox(width: 10), // Space between buttons
          cancelButton(context),
        ],
      ),
    );
  }

  Widget saveButton() {
    return button("Save", () => saveFunction());
  }

  saveFunction() {
    Recipe recipe = new Recipe(
        getKey('title'),
        getKey("subtitle"),
        getKey("preparation_time"),
        getKey("cook_time"),
        getKey("total_time"),
        getKey("level"),
        getKey("servings"),
        getKey("yield"),
        getKey("ingredients"),
        getKey("directions"));
    recipeController.add(recipe);
    print(recipeController.size);
  }

  getKey(String key) {
    return _fbKey.currentState?.fields[key]?.value;
  }

  Widget cancelButton(BuildContext context) {
    return button("Cancel", () => cancelFunction(context));
  }

  cancelFunction(BuildContext context) {
    _showConfirmationDialog(context);
  }

  Widget button(String btnLabel, Function pressFunction) {
    return ElevatedButton(
      onPressed: () => pressFunction(),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.elementColor),
        foregroundColor: WidgetStateProperty.all(AppColors.textColor),
      ),
      child: Text(btnLabel),
    );
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
