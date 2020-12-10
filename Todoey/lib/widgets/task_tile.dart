import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String taskName;
  final bool isChecked;
  final Function onPress;
  final int index;
  final Function deleteTask;
  TaskTile(
    this.taskName,
    this.isChecked,
    this.onPress,
    this.index,
    this.deleteTask,
  );
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          deleteTask(index);
        },
      ),
      title: Text(
        taskName,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: onPress,
      ),
    );
  }
}
