import 'package:flutter/material.dart';
import 'package:custom_calender/custom_calender.dart';
import 'package:custom_calender/src/event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<CalendarEvent> myEvents = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomCalender(
            initialDate: DateTime.now(),

          
            events: myEvents,

            holidays: [DateTime(2026, 2, 17)],

            
            onEventAdded: (event) {
              setState(() {
                myEvents.add(event);
              });
            },
          ),
        ),
      ),
    );
  }
}
