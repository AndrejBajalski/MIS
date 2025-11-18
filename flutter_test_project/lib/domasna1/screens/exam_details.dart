import 'package:flutter/material.dart';
import 'package:namer_app/domasna1/models/exam.dart';

class ExamDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Exam exam = ModalRoute.of(context)!.settings.arguments as Exam;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(57, 129, 230, 1.0),
        foregroundColor: Colors.white,
        title: const Text("Детали за испит", style: TextStyle(fontSize: 24)),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.directional(start: 32, top: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exam.subject,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 32),
            Text("Датум: ${exam.getDate()}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            Text("Време: ${exam.getTime()}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            Text(
              "Простории: ${exam.getClassrooms()}",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: "Статус: ", style: TextStyle(fontSize: 18)),
                  if (exam.date.isAfter(DateTime.now()))
                    TextSpan(
                      text: "тековен",
                      style: TextStyle(fontSize: 18, color: Colors.green[800]),
                    )
                  else
                    TextSpan(
                      text: "изминат",
                      style: TextStyle(fontSize: 18, color: Colors.red[600]),
                    ),
                ],
              ),
            ),
            SizedBox(height: 16),
            if (exam.date.isAfter(DateTime.now()))
              Text(
                printRemainingTime(exam.date),
                style: TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }

  String printRemainingTime(DateTime date) {
    final DateTime today = DateTime.now();
    int hourDiff =
        ((date.millisecondsSinceEpoch - today.millisecondsSinceEpoch) /
                (1000 * 3600)).floor();

    int days = (hourDiff / 24).floor();
    int hours = hourDiff % 24;
    return "Време до испит: $days дена, $hours часа";
  }

  int calculateRemainingDays(DateTime date) {
    final DateTime today = DateTime.now();
    int remainingDays = date.day - today.day;
    return remainingDays;
  }

  int calculateRemainingHours(DateTime date) {
    final DateTime today = DateTime.now();
    int remainingHours = date.hour - today.hour;
    return remainingHours;
  }
}
