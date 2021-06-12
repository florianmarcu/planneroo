import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


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

  // Computes the month day related to the 'index' paramter
  // Adds 'noOfDays' to the first monday date in the calendar
  // if '30th of June' is the first monday, it adds 'noOfDays' to that particular date and returns its respective day number
  int getDayNumberFromFirstDay(int noOfDays){
    int currentDay = today.day; // 26th for ex
    DateTime firstWeekDay = DateTime(today.year,today.month,currentDay%7);
    DateTime firstMondayDate = firstWeekDay.subtract(Duration(days: firstWeekDay.weekday-1));
    return firstMondayDate.add(Duration(days: noOfDays)).day;
    // print(currentWeekday);
    // print(currentDay);
    // return (firstDay+30)%30;

  }
  
  @override
  Widget build(BuildContext context) {
  // print(today.weekday);
  print(getDayNumberFromFirstDay(0).toString() + " prima zi de luni");

    final themeData = Theme.of(context);
    //selectedMonth = 
    //print(selectedMonth);
    return Theme(
      data: themeData.copyWith(
        textTheme: TextTheme(
          bodyText2: TextStyle( // Style of the weekdays
            color: Colors.black,
            fontSize: 18
            //fontWeight: FontWeight.bold
          )
        )
      ),
      child: Scaffold(
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
                  child: Text(
                    weekday
                  ),
                )
              ).toList(),
            ),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7
              ),
              itemCount: 5*7,
              itemBuilder: (context, index) =>
                Container(
                  
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.1)
                  ),
                  width: MediaQuery.of(context).size.width/7-2,
                  child: Text( /// The "current week of the day"
                    getDayNumberFromFirstDay(index).toString(),
                    //index+1 == currentDayOfMonth ? (index+1).toString() : ((index+1)%30).toString(),
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.lightBlue,
                      //fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ),
              // CalendarDatePicker(
              //   lastDate: today,
              //   firstDate: today,
              //   initialDate: today,
              //   onDateChanged: (date){},
              // )
            ],
          )
        ),
      ),
    );
  }
}