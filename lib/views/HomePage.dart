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
  //final currentMonth = DateFormat("MMMM").format(DateTime.now().toLocal());
  // DateTime today = DateTime.now().toLocal();
  DateTime today = DateTime(
    2020,4,23
  );
  String selectedMonth = DateFormat("MMM").format(DateTime.now().toLocal());
  int currentDayOfMonth = DateTime.now().toLocal().day;

  int getFirstMonthDay(){
    int currentWeekday = today.weekday;
    int currentDay = today.day;
    int firstDay = currentDay%7-currentWeekday;
    print(currentWeekday);
    print(currentDay);
    return (firstDay+30)%30;
  }
  
  @override
  Widget build(BuildContext context) {
  print(getFirstMonthDay());

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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: weekdays.map( (weekday) => Container(
                  width: MediaQuery.of(context).size.width/7,
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
                  width: MediaQuery.of(context).size.width/7,
                  child: Text( /// The "current week of the day"
                    index+1 == currentDayOfMonth ? (index+1).toString() : ((index+1)%30).toString(),
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.lightBlue,
                      //fontWeight: FontWeight.bold
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