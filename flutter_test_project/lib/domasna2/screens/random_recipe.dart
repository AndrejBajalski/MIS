import 'package:flutter/material.dart';
import 'package:namer_app/domasna2/services/datafetch_service.dart';
import 'package:namer_app/domasna2/widgets/meal_widget.dart';

class RandomRecipePage extends StatelessWidget {
  final DatafetchService datafetchService = DatafetchService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: datafetchService.fetchRandomMeal(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(title: Text("Random Recipe")),
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(title: Text("Random Recipe")),
            body: Center(child: Text("Error loading recipe")),
          );
        }

        final randomMeal = snapshot.data; // Meal result

        return Scaffold(
          appBar: AppBar(title: Text("Random Recipe of the Week")),
          body: Center(
            child: SizedBox(
              width: 350,
              height: 350,
              child: Padding(
                padding: EdgeInsetsGeometry.all(30),
                child: MealWidget(meal: randomMeal!),
              )
            )
          )
        );
      },
    );
  }
}
