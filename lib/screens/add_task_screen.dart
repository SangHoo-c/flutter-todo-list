import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/modules/task.dart';
import 'package:todo_list/modules/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle = 'hello';
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(40.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '기도제목 추가',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.grey,
              ),
            ),
            Container(
              width: 100.0,
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                decoration: new InputDecoration(
                  border: InputBorder.none,
                ),
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (newText) {
                  newTaskTitle = newText;
                },
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.grey),
              onPressed: () {
                // final task = Task(name: newTaskTitle);
                // Provider.of<TaskData>(context).tasks.add(task);
                // notifyListener 를 호출해야한다. 새로운 Method 를 만들어준다.
                Provider.of<TaskData>(context, listen: false)
                    .addTask(newTaskTitle);
                Navigator.pop(context);
              },
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
