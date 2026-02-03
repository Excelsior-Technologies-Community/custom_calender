import 'package:flutter/material.dart';

class CalendarEvent {
  final DateTime dateTime;
  final String title;
  final Color color;

  const CalendarEvent({
    required this.dateTime,
    required this.title,
    this.color = const Color(0xFF1976D2),
  });
}
