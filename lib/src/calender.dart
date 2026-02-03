import 'dart:ffi';

import 'package:custom_calender/src/widgets/calender_grid.dart';
import 'package:custom_calender/src/widgets/calender_header.dart';
import 'package:custom_calender/src/widgets/week_days.dart';
import 'package:flutter/widgets.dart';

class CustomCalender extends StatefulWidget {
  final DateTime initialDate;
  final ValueChanged<DateTime>? onDateSelected;
  const CustomCalender({
    super.key,
    required this.initialDate,
    this.onDateSelected,
  });

  @override
  State<CustomCalender> createState() => _CustomCalenderState();
}

class _CustomCalenderState extends State<CustomCalender> {
  late DateTime _currentMonth;
  DateTime? _selectedDate;
  @override
  void initState() {
    super.initState();
    _currentMonth = DateTime(widget.initialDate.year, widget.initialDate.month);
    _selectedDate = widget.initialDate;
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        CalenderHeader(
          title: _monthtitle(_currentMonth),
          onNext: _gotonextmonth,
          onPrevious: _gotoPreviousMonth,
        ),
        const SizedBox(height: 8),
        WeekDays(),
        const SizedBox(height: 8),
        CalenderGrid(
          month: _currentMonth,
          selectedDate: _selectedDate,
          onDateTap: onDateTap,
        ),
      ],
    );
  }
  void onDateTap(DateTime date) {
    setState(() {
      _selectedDate = date;
      widget.onDateSelected?.call(date);
    });
  }
  void _gotonextmonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1);
    });
  }
  void _gotoPreviousMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1);
    });
  }
  String _monthtitle(DateTime date) {
    const monthNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return '${monthNames[date.month - 1]} ${date.year}';

}}