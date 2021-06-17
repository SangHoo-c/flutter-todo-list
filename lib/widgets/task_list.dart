import 'package:flutter/material.dart';
import 'package:todo_list/screens/add_task_screen.dart';
import 'package:todo_list/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/modules/task_data.dart';

class TasksList extends StatelessWidget {
  // final List<Task> tasks;
  // TasksList(this.tasks);

  @override
  Widget build(BuildContext context) {
    // context 가 parent 가 어디에 있는지 알려줌!
    // Cosumer widger 으로
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        // 더 좋은(overhead 가 없는) scroll view 가 없는지 찾아보기,
        return SingleChildScrollView(
          physics: ScrollPhysics(),
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            // itemCount: 18,
            itemBuilder: (context, index) {
              final task = taskData.tasks[index];
              return Dismissible(
                key: Key(Provider.of<TaskData>(context).tasks[index].sentence),
                background: Container(
                  padding: EdgeInsets.all(10.0),
                  color: Colors.red,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "DELETE",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                onDismissed: (direction) {
                  taskData.deleteTask(task);
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text("Item deleted")));
                },
                child: TaskTile(
                  isChecked: task.isDone,
                  prayerTopic: task.sentence,
                  currentDate: task.date,
                  checkBoxCallback: (bool? checkBoxState) {
                    taskData.updateToggle(task);
                  },
                  longPressCallback: () {
                    // task 수정할 수 있어야한다.

                    // taskData.deleteTask(task);
                  },
                ),
              );
            },
            itemCount: taskData.taskCount,
          ),
        );
      },
    );
  }
}
