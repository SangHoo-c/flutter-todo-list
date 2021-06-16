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
            return TaskTile(
              isChecked: taskData.tasks[index].isDone,
              taskTitle: taskData.tasks[index].name,
              checkBoxCallback: (bool? checkBoxState) {
                // setState(() {
                //   Provider.of<TaskData>(context).tasks[index].toggleDone();
                // });
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
