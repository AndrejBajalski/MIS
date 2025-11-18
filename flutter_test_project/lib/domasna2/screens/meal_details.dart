import 'package:flutter/material.dart';
import 'package:namer_app/domasna2/models/meal.dart';

class MealDetailsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MealDetails mealDetails =
        ModalRoute.of(context)!.settings.arguments as MealDetails;

    return Scaffold(
      appBar: AppBar(title: Text("Meal Details")),
      body: SingleChildScrollView(
      padding: EdgeInsets.all(22.0),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Center(child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Image.network(mealDetails.thumbnail, width: 200),
          Text(
            mealDetails.name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
          ])
        ),
        SizedBox(height: 8),
        Text(
          "Ingredients:",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(), 
            itemCount: mealDetails.ingredients.length,
            itemBuilder: (context, index) {
              final ingredient = mealDetails.ingredients[index];
              return Row(
                spacing: 6,
                children: [
                  Text(
                    "${ingredient['ingredient']}:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text("${ingredient['measure']}", style: TextStyle(fontSize: 16, )),
                ],
              );
            },
          ),
        SizedBox(height: 8),            
        Text("Instructions for preparation:", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        Text(mealDetails.instructions, style: TextStyle(fontSize: 16))
        ]
    ))
    );
  }
}
