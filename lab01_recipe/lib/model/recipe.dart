//model class for the recipe
class Recipe {
  String? id;
  String? title;
  String? description;
  String? ingredients;

  Recipe({
    required this.id,
    required this.title,
    this.description,
    this.ingredients,
  });

  static recipeList() {}

//list of the Recipe
  static List<Recipe> recipeList() {
    return [];
  }
}
