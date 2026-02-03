import 'package:flutter/widgets.dart';

class CalendarEvent {
  final DateTime date;
  final Color color;

  const CalendarEvent({
    required this.date,
    this.color = const Color.fromARGB(255, 210, 25, 25), // default blue
  });
}
