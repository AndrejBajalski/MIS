import 'package:flutter/material.dart';
import 'package:namer_app/domasna1/widgets/exam_list.dart';

class HomeWidget extends StatelessWidget {
  static const String indeks = "221147";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(57, 129, 230, 1.0),
        foregroundColor: Colors.white,
        title: const Text(
          "Распоред за испити - $indeks",
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Padding(padding: EdgeInsets.all(20), child: ExamList()),
    );
  }
}
