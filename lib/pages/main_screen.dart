import 'package:flutter/material.dart';
import 'package:project1/components/floating_add_button.dart';
import 'package:project1/components/header.dart';
import 'package:project1/constants/breakpoints.dart';
import 'package:project1/main.dart';
import 'package:project1/pages/recipe_grid.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

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
              Header.withSearch(size, onSearchChanged: (query) {
                setState(() {
                  searchQuery = query;
                });
              }),
              Expanded(child: RecipeGrid(searchQuery: searchQuery)),
            ],
          ),
          floatingActionButton:
              size < Breakpoints.tablet ? const FloatingAddButton() : null,
        ));
  }
}
