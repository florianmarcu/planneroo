import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:planneroo/models/Day.dart';
import 'package:planneroo/services/authentication.dart';
import 'package:planneroo/views/DayPage.dart';
import 'package:planneroo/views/widgets/MainDrawer.dart';

import '../models/Task.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final weekdays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  final months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
  DateTime today = DateTime.now();
  String selectedMonth = DateFormat("MMM").format(DateTime.now().toLocal());
  int currentDayOfMonth = DateTime.now().toLocal().day;

  List<Task> tasks = [
    Task(
      title: "Aniversare",
      content: "Aniversarea mea",
      type: TaskType.Goal
    )
  ];

  // Computes the month day related to the 'index' paramter
  // Adds 'noOfDays' to the first monday date in the calendar
  // if '30th of June' is the first monday, it adds 'noOfDays' to that particular date and returns its respective day number
  DateTime getDateFromFirstDay(int noOfDays, int selectedMonth){
    DateTime currentDay = DateTime(today.year, selectedMonth, today.day); // 26th for ex
    DateTime firstWeekDay = DateTime(currentDay.year,currentDay.month,currentDay.day%7);
    DateTime firstMondayDate = firstWeekDay.subtract(Duration(days: firstWeekDay.weekday-1));
    return firstMondayDate.add(Duration(days: noOfDays));
  }
  
  @override
  Widget build(BuildContext context) {
  // print(today.weekday); 
  print(getDateFromFirstDay(0,6).day.toString() + " prima zi de luni");

    final themeData = Theme.of(context);
    //selectedMonth = 
    //print(selectedMonth);
    return Theme(
      data: themeData.copyWith(
        textTheme: TextTheme(
          bodyText2: TextStyle( // Style of the weekdays
            color: Colors.black,
            fontSize: 18,
          ),
        )
      ),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF8B635C),
          child: Icon(Icons.add),
          onPressed: (){},
        ),
        backgroundColor: Color(0xFFF5FFF9),
        drawer: MainDrawer(),
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: DropdownButton(
            items: months.map(
              (month)=> DropdownMenuItem(
                value: month,
                child: Text(
                  month,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25
                  ),
                ),
              )
            ).toList(),
            value: selectedMonth,
            onChanged: (month)=>
              setState(()=>
                selectedMonth = month 
              ),
          )
        ),
        //extendBodyBehindAppBar: true,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal:7),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: weekdays.map( (weekday) => Container(
                    width: MediaQuery.of(context).size.width/7-2,
                    height: 27,
                    child: Text(
                      weekday
                    ),
                  )
                ).toList(),
              ),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.6,
                  crossAxisCount: 7
                ),
                itemCount: 6*7,
                
                itemBuilder: (context, index) =>
                  InkWell(
                    highlightColor: Color(0xFFF5FFF9),
                    splashColor: Color(0xFFAED4BD),
                    onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> DayPage(
                          day: Day(
                            date: getDateFromFirstDay(index-7, months.indexOf(selectedMonth)+1)
                          ),
                          heroTag: "date"+index.toString(),
                        )));
                    },
                    child: Hero(
                      tag: "date"+index.toString(),
                      child: Material(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.1),
                            color: Color(0xFFF5FFF9)
                          ),
                          height: 50,
                          width: MediaQuery.of(context).size.width/7-2,
                          child: Text( /// The "current week of the day"
                            getDateFromFirstDay(index-7, months.indexOf(selectedMonth)+1).day.toString(),
                            //index+1 == currentDayOfMonth ? (index+1).toString() : ((index+1)%30).toString(),
                            style: TextStyle(
                              fontSize: 23,
                              color: Color(0xFF1E2419)
                              //color: Color.fromRGBO(60, 73, 63, 100),
                              //fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ),
              ],
            )
          ),
      ),
    );
  }
}