import 'package:custom_calender/src/event.dart';
import 'package:flutter/widgets.dart';
import 'day_cell.dart';

class CalenderGrid extends StatelessWidget {
  final DateTime month;
  final DateTime? selectedDate;

  /// 🔹 Range support
  final DateTime? rangeStart;
  final DateTime? rangeEnd;

  final ValueChanged<DateTime> onDateTap;
  final List<CalendarEvent> events;

  const CalenderGrid({
    super.key,
    required this.month,
    required this.selectedDate,
    required this.onDateTap,
    required this.events,
    this.rangeStart,
    this.rangeEnd,
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
      itemBuilder: (context, index) {
        print('Events count: ${events.length}');

        final date = DateTime(month.year, month.month, index + 1);
        final dayEvents = events
            .where((e) => _isSameDay(e.date, date))
            .toList();

        final hasEvent = dayEvents.isNotEmpty;
        final eventColor = hasEvent ? dayEvents.first.color : null;

        final today = DateTime.now();

        final isToday = _isSameDay(date, today);

        final isSingleSelected =
            selectedDate != null && _isSameDay(date, selectedDate!);

        final isRangeStart =
            rangeStart != null && _isSameDay(date, rangeStart!);

        final isRangeEnd = rangeEnd != null && _isSameDay(date, rangeEnd!);

        final isInRange =
            rangeStart != null &&
            rangeEnd != null &&
            date.isAfter(rangeStart!) &&
            date.isBefore(rangeEnd!);

        return DayCell(
          day: date.day,
          isSelected: isSingleSelected,
          isInRange: isInRange,
          isRangeStart: isRangeStart,
          isRangeEnd: isRangeEnd,
          isToday: isToday,
          hasEvent: hasEvent,
          eventColor: eventColor,
          onTap: () => onDateTap(date),
        );
      },
    );
  }
}

bool _isSameDay(DateTime a, DateTime b) {
  return a.year == b.year && a.month == b.month && a.day == b.day;
}
