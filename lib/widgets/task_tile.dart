import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String prayerTopic;
  final String currentDate;
  final Function(bool?) checkBoxCallback;
  final void Function()? longPressCallback;

  TaskTile(
      {required this.isChecked,
      required this.prayerTopic,
      required this.currentDate,
      required this.checkBoxCallback,
      required this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      subtitle: Text(currentDate),
      title: Text(
        prayerTopic,
        style: TextStyle(
            decoration:
                isChecked ? TextDecoration.lineThrough : TextDecoration.none),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkBoxCallback,
      ),
    );
  }
}
