import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  final Function addTaskSubmit;
  AddTaskScreen(this.addTaskSubmit);
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String taskMessage;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(35),
          child: Column(
            children: [
              Text(
                "Add Task",
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.lightBlue[200],
                    fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  textAlign: TextAlign.center,
                  autofocus: true,
                  onChanged: (value) {
                    setState(() {
                      taskMessage = value;
                    });
                  },
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightBlue[200], width: 4),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightBlue[200], width: 4),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              FlatButton(
                onPressed: () {
                  widget.addTaskSubmit(taskMessage);
                  Navigator.pop(context);
                },
                child: Text("Add"),
                color: Colors.lightBlue[200],
                textColor: Colors.white,
                minWidth: 300,
              )
            ],
          ),
        ),
      ),
    );
  }
}
