import 'package:flutter/material.dart';
import 'package:namer_app/domasna1/models/exam.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;

  const ExamCard({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() => {
        Navigator.pushNamed(
          context, 
          '/details',
          arguments: exam
        )
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 16),
          child: Padding(
            padding: EdgeInsetsGeometry.all(20),
            child: Column( 
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                exam.subject,
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("Датум: ${exam.getDate()}",  style: TextStyle(fontSize: 16)),
                SizedBox(width: 32),
                Text("Време: ${exam.getTime()}", style: TextStyle(fontSize: 16))
                ]
              ),
              SizedBox(height: 14),
              Text(
                "Место: ${exam.getClassrooms()}",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ]
          )
        )
      )
    );
  }
}
