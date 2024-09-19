import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:trashbuddy/CONSTANT/Colors.dart';
import 'package:trashbuddy/PROVIDER/mainprovider.dart';
import 'package:trashbuddy/USER/pickup_confirmation.dart';
import 'package:trashbuddy/USER/proceed_pickup.dart';
import '../CONSTANT/widget.dart';

class CalendarPage2 extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage2> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: green1,
      appBar: AppBar(
        backgroundColor: green2,
        title: Text("Schedule Garbage Pickup",
            style: TextStyle(
                fontSize: 20,
                fontFamily: "kadwa",
                fontWeight: FontWeight.w500,
                color: white)),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.chevron_left, size: 30, color: white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10,right: 10),
              child: Text(
                "Select the date and timing",
                style: TextStyle(
                  fontSize: 21,
                  fontFamily: "kadwa",
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Center(
              child: Container(
                height: height / 1.9,
                width: width / 1.1,
                decoration: BoxDecoration(
                    color: line, borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5,right: 5,),
                  child: Column(
                    children: [

                      // SizedBox(height: 10),
                      TableCalendar(
                        firstDay: DateTime.utc(2010, 10, 16),
                        lastDay: DateTime.utc(2030, 3, 14),
                        focusedDay: _focusedDay,
                        calendarFormat: _calendarFormat,
                        selectedDayPredicate: (day) {
                          return isSameDay(_selectedDay, day);
                        },
                        onDaySelected: (selectedDay, focusedDay) {
                          if (!isSameDay(_selectedDay, selectedDay)) {
                            setState(() {
                              _selectedDay = selectedDay;
                              _focusedDay = focusedDay;
                            });
                          }
                        },
                        onFormatChanged: (format) {
                          if (_calendarFormat != format) {
                            setState(() {
                              _calendarFormat = format;
                            });
                          }
                        },
                        onPageChanged: (focusedDay) {
                          _focusedDay = focusedDay;
                        },
                        calendarStyle: CalendarStyle(
                          defaultTextStyle: TextStyle(color: white,fontFamily: "kadwa"),
                          weekendTextStyle: TextStyle(color: white,fontFamily: "kadwa"),
                          selectedTextStyle: TextStyle(color: green1,fontFamily: "kadwa"),
                          todayTextStyle: TextStyle(color: green1,fontFamily: "kadwa"),
                          outsideTextStyle: TextStyle(color: Colors.grey),
                        ),
                        headerStyle: HeaderStyle(
                          titleTextStyle: TextStyle(color: white,fontFamily: "kadwa",fontSize: 18),
                          formatButtonTextStyle: TextStyle(color: green2,fontFamily: "kadwa"),
                          formatButtonDecoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          leftChevronIcon: Icon(
                            Icons.chevron_left,
                            color: white,
                          ),
                          rightChevronIcon: Icon(
                            Icons.chevron_right,
                            color: white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(200, 10, 15, 10),
                        child: Row(
                          children: [
                            Text("Cancel", style: TextStyle(
                                fontSize: 14,
                                fontFamily: "kadwa",
                                color: white,
                                fontWeight: FontWeight.w600
                            ),),
                            SizedBox(
                              width: 20,
                            ),
                            Text("Ok", style: TextStyle(
                                fontSize: 14,
                                fontFamily: "kadwa",
                                color: white,
                                fontWeight: FontWeight.w600
                            ),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 65,
                  height: 55,
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: green6),
                  ),
                  child: Center(
                    child: Text(
                      '${selectedTime.hourOfPeriod}',
                      style: TextStyle(
                          fontSize: 17.0,
                          fontFamily: "kadwa"),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Text(":", style: TextStyle(
                    fontWeight: FontWeight.bold
                ),),
                SizedBox(width: 10),
                Container(
                  width: 65,
                  height: 55,
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: green6),
                  ),
                  child: Center(
                    child: Text(
                      '${selectedTime.minute.toString().padLeft(2, '0')}',
                      style: TextStyle(
                          fontSize: 17.0,
                          fontFamily: "kadwa"),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Text(":", style: TextStyle(
                    fontWeight: FontWeight.bold
                ),),
                SizedBox(width: 10),
                Container(
                  width: 65,
                  height: 55,
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: green6),
                  ),
                  child: Center(
                    child: Text(
                      selectedTime.period == DayPeriod.am ? 'AM' : 'PM',
                      style: TextStyle(
                          fontSize: 17.0,
                          fontFamily: "kadwa"),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: Text('Select Time', style: TextStyle(
                  fontFamily: "kadwa"
              ),),
              style: ElevatedButton.styleFrom(
                side: BorderSide(color: green6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            SizedBox(
              height:1,
            ),
            Consumer<mainProvider>(
              builder: (context,value,child) {
                return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProceedPickup()
                      )
                      );
                    },
                    child: btn2(btn1, "Next", white, 150, 40, 16, FontWeight.w500, "kadwa"));
              }
            ),
          ],
        ),
      ),
    );
  }
}
