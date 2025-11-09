import 'package:flutter/material.dart';
import 'package:namer_app/screens/exam_details.dart';
import 'package:namer_app/screens/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => HomeWidget(),
        "/details": (context) => ExamDetails()
      }
    );
  }
}
