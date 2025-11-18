import 'package:flutter/material.dart';
import 'package:namer_app/domasna2/models/meal.dart';
import 'package:namer_app/domasna2/services/datafetch_service.dart';

class MealWidget extends StatelessWidget {
  final Meal meal;

  MealWidget({required this.meal});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final mealDetails = await getMealDetails(meal.id);
        Navigator.pushNamed(context, '/mealDetails', arguments: mealDetails);
      },
      child: Card(
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                meal.thumbnail,
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ),
            SizedBox(height: 8),
            Text(
              meal.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Future<MealDetails> getMealDetails(String id) async {
    final DatafetchService datafetchService = DatafetchService();
    return datafetchService.fetchMealDetails(id);
  }
}
