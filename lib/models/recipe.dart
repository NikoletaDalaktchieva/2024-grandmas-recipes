class Recipe {
  static int counterId = 0;
  int id;
  String title;
  String subtitle;
  String? preparationTime;
  String? cookTime;
  String? totalTime;
  String? level;
  String? servings;
  String? yield;
  String? ingredients;
  String? directions;

  Recipe(
      this.title,
      this.subtitle,
      this.preparationTime,
      this.cookTime,
      this.totalTime,
      this.level,
      this.servings,
      this.yield,
      this.ingredients,
      this.directions)
      : id = counterId++;

  Map toJson() => {
        'title': title,
        'subtitle': subtitle,
        'preparationTime': preparationTime,
        'cookTime': cookTime,
        'totalTime': totalTime,
        'level': level,
        'servings': servings,
        'yield': yield,
        'ingredients': ingredients,
        'directions': directions,
      };

  factory Recipe.fromJson(Map json) {
    return Recipe(
      json['title'],
      json['subtitle'],
      json['preparationTime'],
      json['cookTime'],
      json['totalTime'],
      json['level'],
      json['servings'],
      json['yield'],
      json['ingredients'],
      json['directions'],
    );
  }

  @override
  String toString() {
    return '''
    Recipe:
      Title: $title
      Subtitle: $subtitle
      Preparation Time: $preparationTime
      Cook Time: $cookTime
      Total Time: $totalTime
      Level: $level
      Servings: $servings
      Yield: $yield
      Ingredients: $ingredients
      Directions: $directions
    ''';
  }
}
