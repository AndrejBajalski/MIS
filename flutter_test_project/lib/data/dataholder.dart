import 'package:namer_app/models/exam.dart';

class Dataholder {
  static List<Exam> exams = [
    Exam(
      subject: "Веб базирани системи",
      date: DateTime(2025, 11, 20, 14, 30),
      classrooms: ["Lab 138"],
    ),
    Exam(
      subject: "Мобилни информациски системи",
      date: DateTime(2025, 12, 13, 8, 0),
      classrooms: ["Амф. ФЕИТ", "Б2.1"],
    ),
    Exam(
      subject: "Линеарна алгебра и примени",
      date: DateTime(2025, 11, 17, 10, 0),
      classrooms: ["Амф ФЕИТ, Амф. ФИНКИ, Б2.2"],
    ),
    Exam(
      subject: "Напреден веб дизајн",
      date: DateTime(2025, 11, 19, 18, 30),
      classrooms: ["Lab 117", "Lab 12", "Lab 13"],
    ),
    Exam(
      subject: "Веб програмирање",
      date: DateTime(2025, 12, 03, 18, 30),
      classrooms: ["Lab 117", "Lab 12", "Lab 13"],
    ),
    Exam(
      subject: "Калкулус",
      date: DateTime(2022, 11, 19, 18, 30),
      classrooms: ["Lab 117", "Lab 12", "Lab 13"],
    ),
  ];

  static List<Exam> listExams() {
    exams.sort((a, b) => a.date.compareTo(b.date));
    return exams;
  }

  static int numberOfExams() {
    return exams.length;
  }
}
