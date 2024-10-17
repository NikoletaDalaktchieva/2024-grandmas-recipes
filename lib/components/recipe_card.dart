import 'package:flutter/material.dart';
import 'package:project1/constants/breakpoints.dart';
import 'package:project1/models/recipe.dart';
import 'package:get/get.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  RecipeCard(this.recipe);

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Card(
        child: size < Breakpoints.mobile
            ? Row(children: content(size))
            : Column(children: content(size)));
  }

  List<Widget> content(size) {
    return [
      GestureDetector(
          onTap: () {
            Get.toNamed("/recipe/${recipe.id}");
          },
          child: Container(
            width: size < Breakpoints.mobile ? 200 : size,
            height: size < Breakpoints.mobile ? size : 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(recipe.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          )),
      size < Breakpoints.mobile
          ? Expanded(child: textInformation())
          : textInformation()
    ];
  }

  ListTile textInformation() {
    return ListTile(
      title: Text(recipe.title, maxLines: 1),
      subtitle: Text(recipe.subtitle, maxLines: 3),
      trailing: IconButton(
        icon: const Icon(Icons.edit),
        onPressed: () {
          Get.toNamed("/edit_recipe/${recipe.id}");
        },
      ),
    );
  }
}
