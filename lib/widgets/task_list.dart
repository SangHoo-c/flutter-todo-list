import 'package:flutter/material.dart';
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
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return Dismissible(
              key: Key(Provider.of<TaskData>(context).tasks[index].name),
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
                taskTitle: task.name,
                checkBoxCallback: (bool? checkBoxState) {
                  taskData.updateTask(task);
                },
                longPressCallback: () {
                  taskData.deleteTask(task);
                },
              ),
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
