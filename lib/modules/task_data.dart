import 'package:flutter/foundation.dart';
import 'package:todo_list/modules/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'buy milk'),
    Task(name: 'buy eggs'),
    Task(name: 'do stuff'),
  ];

  int get taskCount {
    return tasks.length;
  }
}
