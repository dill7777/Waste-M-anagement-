import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:trashbuddy/CONSTANT/Colors.dart';

import '../CONSTANT/widget.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

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
              padding: EdgeInsets.only(top: 30),
              child: Center(
                child: Text(
                  "Select the date and timing",
                  style: TextStyle(
                    fontSize: 21,
                    fontFamily: "kadwa",
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                height: height / 1.8,
                width: width / 1.1,
                decoration: BoxDecoration(
                    color: line, borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
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
                          defaultTextStyle: TextStyle(color: white),
                          weekendTextStyle: TextStyle(color: white),
                          selectedTextStyle: TextStyle(color: green1),
                          todayTextStyle: TextStyle(color: green1),
                          outsideTextStyle: TextStyle(color: Colors.black),
                        ),
                        headerStyle: HeaderStyle(
                          titleTextStyle: TextStyle(color: white),
                          formatButtonTextStyle: TextStyle(color: green2),
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
                        padding: EdgeInsets.fromLTRB(200, 10, 15, 15),
                        child: Row(
                          children: [
                            Text(
                              "Cancel",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "kadwa",
                                  color: white,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Ok",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "kadwa",
                                  color: white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            btn2(white, "Next", green6, 130, 40, 16, FontWeight.w500, "kadwa"),
          ],
        ),
      ),
    );
  }
}
