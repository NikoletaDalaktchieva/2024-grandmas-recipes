import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:project1/models/recipe.dart';

class RecipeController {
  final storage = Hive.box("storage");
  RxList recipes;

  RecipeController() : recipes = [].obs {
    if (storage.get('recipes') == null) {
      storage.put('recipes', []);
    }
    recipes.value = storage
        .get('recipes')
        .map(
          (recipe) => Recipe.fromJson(recipe),
        )
        .toList();
  }

  void _save() {
    storage.put(
      'recipes',
      recipes.map((task) => task.toJson()).toList(),
    );
  }

  void add(Recipe recipe) {
    recipes.add(recipe);
    _save();
  }

  void update(int id, Recipe newRecipe) {
    int index = recipes.indexWhere((recipe) => recipe.id == id);
    if (index >= 0 && index < recipes.length) {
      recipes[index] = newRecipe;
    } else {
      print('Index out of bounds');
    }
  }

  Recipe get(int index) {
    return recipes[index];
  }

  get size => recipes.length;
}
