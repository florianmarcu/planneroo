import 'package:flutter/material.dart';
import 'package:planneroo/models/Day.dart';

class DayPage extends StatelessWidget {

  final Day day;
  final String heroTag;
  final weekdays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  final months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

  DayPage({this.heroTag, this.day});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: Scaffold(
        body: SafeArea(
          child: Material(
            child: Container(
              // padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 50,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          weekdays[day.date.weekday-1] + "\n"+
                          day.date.day.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25
                          ),
                        ),
                        Expanded(child: Container(),),
                        Text(
                          "" + months[day.date.month] + " "+  day.date.year.toString(),
                          style: TextStyle(
                            fontSize: 25
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  SizedBox(height: 0.5,child: Container(color: Color(0xFF1E2419),),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}