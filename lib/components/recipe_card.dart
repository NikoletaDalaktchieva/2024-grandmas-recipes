import 'package:flutter/material.dart';
import 'package:project1/constants.dart';

class RecipeCard extends StatelessWidget {
  final String title;
  final String description;

  RecipeCard(this.title, this.description);

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
      Container(
        width: size < Breakpoints.mobile ? 200 : size,
        height: size < Breakpoints.mobile ? size : 200,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/hamburger_recipe.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      size < Breakpoints.mobile
          ? Expanded(child: textInformation())
          : textInformation()
    ];
  }

  ListTile textInformation() {
    return ListTile(
      title: Text(title),
      subtitle: Text(description),
      trailing: const Icon(Icons.favorite_outline),
    );
  }
}
