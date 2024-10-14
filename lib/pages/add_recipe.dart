import 'package:flutter/material.dart';
import 'package:project1/components/header.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:project1/constants/app_colors.dart';
import 'package:project1/constants/breakpoints.dart';

class AddRecipe extends StatelessWidget {
  const AddRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(children: [
        Header(size.width),
        const SizedBox(height: 5),
        Expanded(
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
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
                        ]))))
      ]),
      floatingActionButton: footerButtons(),
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
          child: TextFormField(
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
          child: TextFormField(
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

  Widget footerButtons() {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          saveButton(),
          const SizedBox(width: 10), // Space between buttons
          cancelButton(),
        ],
      ),
    );
  }

  Widget saveButton() {
    return button("Save");
  }

  Widget cancelButton() {
    return button("Cancel");
  }

  Widget button(String btnLabel) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.elementColor),
        foregroundColor: WidgetStateProperty.all(AppColors.textColor),
      ),
      child: Text(btnLabel),
    );
  }
}
