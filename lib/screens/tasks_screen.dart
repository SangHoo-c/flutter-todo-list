import 'package:flutter/material.dart';
import 'package:todo_list/widgets/task_list.dart';
import 'package:todo_list/screens/add_task_screen.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/modules/task_data.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Colors.grey,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            // builder 는 Function 을 인자로 필요로 한다. 익명함수 선언.
            builder: (context) => AddTaskScreen(),
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: 60.0,
              left: 30.0,
              right: 30.0,
              bottom: 30.0,
            ),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // column 안에 있는 항목들 정렬 방법
              children: <Widget>[
                // CircleAvatar(
                //   child: Icon(
                //     Icons.list,
                //     size: 30.0,
                //     color: Colors.grey,
                //   ),
                //   backgroundColor: Colors.white,
                //   radius: 30.0,
                // ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  '기도노트',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} 개의 기도제목이 있습니다.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: TasksList(),
            ),
          ),
        ],
      ),
    );
  }
}
