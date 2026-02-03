import 'package:custom_calender/src/event.dart';
import 'package:custom_calender/src/range_picker.dart';
import 'package:flutter/widgets.dart';

import 'widgets/calender_grid.dart';
import 'widgets/calender_header.dart';
import 'widgets/week_days.dart';

class CustomCalender extends StatefulWidget {
  final DateTime initialDate;
  final ValueChanged<DateTime>? onDateSelected;
  final List<CalendarEvent> events;

  const CustomCalender({
    super.key,
    required this.initialDate,
    this.onDateSelected,
    this.events = const [],
  });

  @override
  State<CustomCalender> createState() => _CustomCalenderState();
}

class _CustomCalenderState extends State<CustomCalender> {
  late DateTime _currentMonth;

  /// Today always selected
  DateTime get _today => DateTime.now();

  final DateRangeController _rangeController = DateRangeController();

  @override
  void initState() {
    super.initState();

    DateTime(
      widget.initialDate.year,
      widget.initialDate.month,
      widget.initialDate.day,
    );

    _currentMonth = DateTime(_today.year, _today.month);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalenderHeader(
          title: _monthTitle(_currentMonth),
          onNext: _goToNextMonth,
          onPrevious: _goToPreviousMonth,
        ),
        const SizedBox(height: 8),
        const WeekDays(),
        const SizedBox(height: 8),
        CalenderGrid(
          month: _currentMonth,
          selectedDate: _today, // 🔥 today always selected
          rangeStart: _rangeController.rangeStart,
          rangeEnd: _rangeController.rangeEnd,
          events: widget.events,
          onDateTap: _onDateTap,
        ),
      ],
    );
  }

  void _onDateTap(DateTime date) {
    setState(() {
      _rangeController.onDateTap(date);
    });
  }

  void _goToNextMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1);
    });
  }

  void _goToPreviousMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1);
    });
  }

  String _monthTitle(DateTime date) {
    const months = [
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
      'December',
    ];
    return '${months[date.month - 1]} ${date.year}';
  }
}
