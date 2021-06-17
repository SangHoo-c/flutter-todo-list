import 'package:flutter/foundation.dart';
import 'package:todo_list/modules/task.dart';
import 'dart:collection';
import 'package:date_format/date_format.dart';

class TaskData extends ChangeNotifier {
  // task 를 private 하게 만들어서 보호한다.
  List<Task> _tasks = [
    Task(sentence: '기도노트가 잘 만들어질 수 있도록 지혜주세요.', date: '2021.03.01'),
    Task(
        sentence: '열림교회 청년부들이 예수님의 발자취를 따라갈 수 있도록 인도해주세요.', date: '2021.06.01'),
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
    DateTime currentDateTime = DateTime.now();
    String currentDateTimeString =
        formatDate(currentDateTime, [yyyy, '.', mm, '.', dd]);
    final task = Task(sentence: newTaskTitle, date: currentDateTimeString);
    _tasks.add(task);
    notifyListeners();
  }

  void updateToggle(Task task) {
    task.toggleDone();
    notifyListeners(); // update Widget
  }

  void updatePray(String newTaskTitle) {
    // DateTime currentDateTime = DateTime.now();
    // String currentDateTimeString =
    //     formatDate(currentDateTime, [yyyy, '.', mm, '.', dd]);
    // final task = Task(sentence: newTaskTitle, date: currentDateTimeString);
    // _tasks.add(task);
    // notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
