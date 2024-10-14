import 'package:flutter/material.dart';
import 'package:project1/components/recipe_card.dart';
import 'package:project1/constants/breakpoints.dart';

class RecipeGrid extends StatelessWidget {
  final String searchQuery;
  final List<RecipeCard> items;

  RecipeGrid({required this.searchQuery})
      : items = Iterable<int>.generate(12)
            .map((i) => RecipeCard("Title $i", "Subtitle"))
            .toList();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    int count = width < Breakpoints.mobile ? 1 : width ~/ 300;
    final filteredItems = items
        .where((item) =>
            item.title.toLowerCase().contains(searchQuery.toLowerCase()))
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
