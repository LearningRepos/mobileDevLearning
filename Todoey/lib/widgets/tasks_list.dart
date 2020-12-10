import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:Todoey/models/task.dart';

class TasksList extends StatefulWidget {
  final List<Task> tasks;
  final Function deleteTask;
  TasksList(this.tasks, this.deleteTask);
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          widget.tasks[index].name,
          widget.tasks[index].isDone,
          (selectedValue) {
            setState(() {
              widget.tasks[index].toggleDone();
            });
          },
          index,
          widget.deleteTask,
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}
