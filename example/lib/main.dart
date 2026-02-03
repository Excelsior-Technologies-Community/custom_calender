import 'package:flutter/material.dart';
import 'package:custom_calender/custom_calender.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomCalender(
            initialDate: DateTime.now(),
            events: [
              CalendarEvent(date: DateTime.now()),
              CalendarEvent(
                date: DateTime.now().add(const Duration(days: 10)),
                color: const Color(0xFFD32F2F),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
