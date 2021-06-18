import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/modules/task_data.dart';
import 'screens/home_page.dart';
import 'package:provider/provider.dart';
import 'modules/task_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}
