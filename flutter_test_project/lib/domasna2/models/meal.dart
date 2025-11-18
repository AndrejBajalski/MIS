class Meal {
  String thumbnail;
  String name;
  String id;

  Meal({required this.id, required this.name, required this.thumbnail});
}

class MealDetails {
  String name;
  String thumbnail;
  String instructions;
  List<Map<String, String>> ingredients = [];
  String? youtubeLink;

  MealDetails({required this.name, required this.thumbnail, required this.instructions, required this.ingredients, this.youtubeLink});

  static List<Map<String, String>> parseIngredients(dynamic json) {
    List<Map<String, String>> ingredients = []; 
    for(int i=1; i<=20; i++) {
      String ingredientKey = 'strIngredient$i';
      String measureKey = 'strMeasure$i';
      String? ingredient = json[ingredientKey];
      String? measure = json[measureKey];
      if(ingredient != null && ingredient.isNotEmpty) {
        ingredients.add({ 'ingredient': ingredient, 'measure': measure ?? '' });
      }
    }
    return ingredients;
  }
}
