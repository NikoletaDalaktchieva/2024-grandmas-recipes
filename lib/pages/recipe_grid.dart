import 'package:flutter/material.dart';
import 'package:project1/components/recipe_card.dart';
import 'package:project1/constants/breakpoints.dart';
import 'package:project1/controllers/recipe_controler.dart';
import 'package:get/get.dart';

class RecipeGrid extends StatelessWidget {
  final String searchQuery;
  final recipeController = Get.find<RecipeController>();

  RecipeGrid({required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    final List<RecipeCard> items = Iterable<int>.generate(recipeController.size)
        .map((i) => RecipeCard(recipeController.get(i)))
        .toList();

    double width = MediaQuery.of(context).size.width;
    int count = width < Breakpoints.mobile ? 1 : width ~/ 300;
    final filteredItems = items
        .where((item) =>
            item.recipe.title.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return GridView.count(
      crossAxisCount: count,
      padding: const EdgeInsets.all(10),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: count == 1 ? (2 / 1) : (1 / 1),
      children: filteredItems,
    );
  }
}
