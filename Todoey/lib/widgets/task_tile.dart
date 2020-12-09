import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Do The Dishes"),
      trailing: Checkbox(
        value: false,
        onChanged: null,
      ),
    );
  }
}
