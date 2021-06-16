import 'package:flutter/foundation.dart';
import 'package:todo_list/modules/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  // task 를 private 하게 만들어서 보호한다.
  List<Task> _tasks = [
    Task(name: 'buy milk'),
    Task(name: 'buy eggs'),
    Task(name: 'do stuff'),
  ];

  // 외부에서 tasks 에 대한 호출이 필요한 경우 , getter 를 사용해서 반환한다.
  // tasks 의 이름이 필요한 리스트로 헷갈리는 경우가 있으니, 수정시 에러를 반환하도록 선언한다.
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners(); // update Widget
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
