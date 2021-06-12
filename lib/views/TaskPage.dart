import 'package:flutter/material.dart';
import 'package:planneroo/models/Task.dart';

class TaskPage extends StatefulWidget {

  final Task task;

  TaskPage({this.task});

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                widget.task.type.toString(),
                style: TextStyle(
                    fontSize: 23,
                    color: Colors.lightBlue,
                    fontWeight: FontWeight.bold
                  ),
              )
            ],
          ),
        )
      )
      
    );
  }
}