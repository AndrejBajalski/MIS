class Exam {
  String subject;
  DateTime date;
  List<String> classrooms;

  Exam({required this.subject, required this.date, required this.classrooms});

  String getDate() {
    return "${date.day}/${date.month}/${date.year}";
  }

  String getTime() {
    return "${date.hour}:${date.minute}";
  }

 String getClassrooms() {
   return classrooms.map((classroom) => classroom.toString()).join(', ');
 }

}
