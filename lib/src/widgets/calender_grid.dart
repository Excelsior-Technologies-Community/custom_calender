import 'package:flutter/material.dart';
import '../event.dart';
import '../range_picker.dart';
import 'day_cell.dart';

class CalenderGrid extends StatelessWidget {
  final DateTime month;
  final DateTime today;
  final DateTime? selectedDate;
  final DateRangeController rangeController;
  final List<CalendarEvent> events;
  final List<DateTime> holidays;
  final ValueChanged<DateTime> onDateTap;

  const CalenderGrid({
    super.key,
    required this.month,
    required this.today,
    required this.selectedDate,
    required this.rangeController,
    required this.events,
    required this.holidays,
    required this.onDateTap,
  });

  @override
  Widget build(BuildContext context) {
    final daysInMonth = DateTime(month.year, month.month + 1, 0).day;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
      ),
      itemCount: daysInMonth,
      itemBuilder: (_, index) {
        final date = DateTime(month.year, month.month, index + 1);

        final isWeekend =
            date.weekday == DateTime.saturday ||
            date.weekday == DateTime.sunday;

        final isHoliday = holidays.any((d) => _isSameDay(d, date));

        final isDisabled = isWeekend || isHoliday;

        bool hasEvent = false;
        Color? eventColor;

        for (final event in events) {
          if (_isSameDay(event.dateTime, date)) {
            hasEvent = true;
            eventColor = event.color;
            break;
          }
        }

        return DayCell(
          day: date.day,
          isToday: _isSameDay(date, today),
          isSelected: selectedDate != null && _isSameDay(date, selectedDate!),
          isRangeStart: rangeController.isStart(date),
          isRangeEnd: rangeController.isEnd(date),
          isInRange: rangeController.isInRange(date),
          hasEvent: hasEvent,
          eventColor: eventColor,
          isDisabled: isDisabled,
          onTap: () => onDateTap(date),
        );
      },
    );
  }
}

bool _isSameDay(DateTime a, DateTime b) =>
    a.year == b.year && a.month == b.month && a.day == b.day;
