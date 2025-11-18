import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:namer_app/domasna2/models/category.dart';
import 'package:namer_app/domasna2/models/meal.dart';

class DatafetchService {
  // ignore: non_constant_identifier_names
  final String baseURL = "https://www.themealdb.com/api/json/v1/1";

  Future<List<FoodCategory>> fetchCategories() async {
    String allURI = "$baseURL/categories.php";
    var response = await http.get(Uri.parse(allURI));
    var responseJson = jsonDecode(response.body);
    List<FoodCategory> categories = responseJson['categories']
        .map<FoodCategory>((json) {
          return FoodCategory(
            name: json['strCategory'],
            id: json['idCategory'],
            thumbnail: json['strCategoryThumb'],
            description: json['strCategoryDescription'],
          );
        })
        .toList();
    return categories;
  }

  Future<List<Meal>> fetchMealsByCategory(String category) async {
    String categoryURL = "$baseURL/filter.php?c=$category";
    var response = await http.get(Uri.parse(categoryURL));
    var responseJson = jsonDecode(response.body);
    List<Meal> categories = responseJson['meals'].map<Meal>((json) {
      return Meal(
        id: json['idMeal'],
        name: json['strMeal'],
        thumbnail: json['strMealThumb'],
      );
    }).toList();
    return categories;
  }

  Future<MealDetails> fetchMealDetails(String id) async {
    String detailsURL = "$baseURL/lookup.php?i=$id";
    var response = await http.get(Uri.parse(detailsURL));
    var responseJson = jsonDecode(response.body);
    return responseJson['meals'].map((json) {
      return MealDetails(
        name: json['strMeal'],
        thumbnail: json['strMealThumb'],
        instructions: json['strInstructions'],
        ingredients: MealDetails.parseIngredients(json),
        youtubeLink: json['strYoutube']?? 'N/A',
      );
    }).toList().first;
  }
}
