import 'package:flutter/material.dart';
import 'package:namer_app/domasna2/models/meal.dart';

class MealDetailsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MealDetails mealDetails =
        ModalRoute.of(context)!.settings.arguments as MealDetails;

    return Scaffold(
      appBar: AppBar(
        title: Text("Meal Preparation details for ${mealDetails.name}"),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20.0),
        child: Row(children: [
          Image.network(mealDetails.thumbnail),
          Column(
            children: [
              Text("Ingredients:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              ListView.builder(
                itemCount: mealDetails.ingredients.length,
                itemBuilder: (context, index) {
                  final ingredient = mealDetails.ingredients[index];
                  return Row(
                    children: [
                      Text("${ingredient['ingredient']}", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("${ingredient['measure']}"),
                    ],
                  );
                },
              ),
              Text("YouTube Link: $mealDetails.youtubeLink"),
            ]),
          ],
        ),
      ),
    );
  }
}
