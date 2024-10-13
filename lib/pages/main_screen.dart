import 'package:flutter/material.dart';
import 'package:project1/components/floating_add_button.dart';
import 'package:project1/components/header.dart';
import 'package:project1/constants.dart';
import 'package:project1/main.dart';
import 'package:project1/pages/recipe_grid.dart';

class MainScreen extends StatefulWidget {
  // Change to StatefulWidget
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainScreen> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return MaterialApp(
        scrollBehavior: CustomScrollBehavior(),
        home: Scaffold(
          body: Column(
            children: [
              Header(size, onSearchChanged: (query) {
                setState(() {
                  searchQuery = query; // Update the search query state
                });
              }),
              Expanded(child: RecipeGrid(searchQuery: searchQuery)),
            ],
          ),
          floatingActionButton:
              size < Breakpoints.tablet ? FloatingAddButton() : null,
        ));
  }
}
