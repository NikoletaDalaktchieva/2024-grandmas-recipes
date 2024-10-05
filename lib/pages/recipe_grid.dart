import 'package:flutter/material.dart';
import 'package:project1/components/recipe_card.dart';
import 'package:project1/constants.dart';

class RecipeGrid extends StatelessWidget {
  final items = Iterable<int>.generate(12)
      .map(
        (i) => RecipeCard("Title", "Subtitle"),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    int count = width < Breakpoints.mobile ? 1 : width ~/ 300;

    return GridView.count(
      crossAxisCount: count,
      padding: EdgeInsets.all(10),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: items,
      childAspectRatio: count == 1 ? (2 / 1) : (1 / 1),
    );
  }
}
