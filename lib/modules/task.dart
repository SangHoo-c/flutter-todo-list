import 'package:date_format/date_format.dart';

class Task {
  final String sentence;
  final String date;
  bool isDone;

  Task({
    this.sentence = 'default',
    this.isDone = false,
    this.date = '2020.01.01',
  });

  void toggleDone() {
    isDone = !isDone;
  }
}
