import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text( /// The "current week of the day"
                  "Monday",
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.lightBlue,
                    fontWeight: FontWeight.bold
                  ),
                ),
                
              )
            ]
          ),
        )
      ),
    );
  }
}