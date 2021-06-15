class Task {
  final String name;
  bool isDone;

  Task({this.name = 'default', this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
