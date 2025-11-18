import 'package:flutter/material.dart';
import 'package:namer_app/domasna1/data/dataholder.dart';
import 'package:namer_app/domasna1/models/exam.dart';
import 'package:namer_app/domasna1/widgets/exam_card.dart';

class ExamList extends StatelessWidget {
  final List<Exam> allExams = Dataholder.listExams();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Тековни испити:", style: TextStyle(fontSize: 24)), 
        Expanded(
          child: ListView.builder(
          itemCount: allExams.length,
          itemBuilder: (context, index) {
            return ExamCard(exam: allExams[index]);
          },
        )
        ),
        SizedBox(height: 30),
        Text("Вкупно испити: ${allExams.length}", style: TextStyle(fontSize: 18))
        ]
    );
  }
}
