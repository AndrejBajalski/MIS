import 'package:flutter/material.dart';
import 'package:namer_app/domasna2/screens/home.dart';
import 'package:namer_app/domasna2/screens/meal_details.dart';
import 'package:namer_app/domasna2/screens/meals.dart';
import 'package:namer_app/domasna2/screens/random_recipe.dart';
//packages for homework exercise 1
// import 'package:namer_app/domasna1/screens/exam_details.dart';
// import 'package:namer_app/domasna1/screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:namer_app/domasna2/services/firebase_messaging_service.dart';
import 'package:namer_app/domasna2/services/local_notifications_service.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( options: DefaultFirebaseOptions.currentPlatform);
  final localNotificationsService = LocalNotificationsService.instance();
  await localNotificationsService.init();
  final firebaseMessagingService = FirebaseMessagingService.instance();
  await firebaseMessagingService.init(localNotificationsService: localNotificationsService);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // Background color
        colorScheme: ColorScheme.light(
          primary: Colors.blue,
          onPrimary: Colors.white,
          surface: Colors.white, // Alternative background
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.black), // Default text color
        ),
      ),
      
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
        "/mealDetails": (context) => MealDetailsWidget(),
        "/randomRecipe": (context) => RandomRecipePage()
      },
    );
  }
}
