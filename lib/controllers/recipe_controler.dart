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

  void update(Recipe recipe) {
    int index = recipes.indexWhere((r) => r.id == recipe.id);
    if (index >= 0 && index < recipes.length) {
      recipes[index] = recipe;
    } else {
      recipes.add(recipe);
    }
    _save();
  }

  Recipe get(int index) {
    return recipes[index];
  }

  bool isExist(int id) {
    int index = recipes.indexWhere((r) => r.id == id);
    return index >= 0 && index < recipes.length;
  }

  get size => recipes.length;
}
