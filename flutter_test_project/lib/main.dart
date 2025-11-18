import 'package:flutter/material.dart';
import 'package:namer_app/domasna2/screens/home.dart';
import 'package:namer_app/domasna2/screens/meal_details.dart';
import 'package:namer_app/domasna2/screens/meals.dart';
//packages for homework exercise 1
// import 'package:namer_app/domasna1/screens/exam_details.dart';
// import 'package:namer_app/domasna1/screens/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      //routing for homework exercise 1
      // routes: {
      //   "/": (context) => HomeWidget(),
      //   "/details": (context) => ExamDetails()
      // }
      
      //routing for homework exercise 2
      routes: {
        "/": (context) => HomePage(),
        "/meals": (context) => MealsPage(),
        "/mealDetails": (context) => MealDetailsWidget()
      },
    );
  }
}
