import 'package:custom_calender/src/event.dart';
import 'package:custom_calender/src/widgets/day_cell.dart';
import 'package:flutter/widgets.dart';

class CalenderGrid extends StatelessWidget {
  final DateTime month;
  final DateTime? rangeStart;
  final DateTime? rangeEnd;

  final DateTime? selectedDate;
  final ValueChanged<DateTime> onDateTap;
  const CalenderGrid({
    super.key,
    required this.month,
    required this.selectedDate,
    required this.onDateTap,
    this.rangeStart,
    this.rangeEnd,
  });

  @override
  Widget build(BuildContext context) {
    final daysinmonth = DateTime(month.year, month.month + 1, 0).day;
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
      ),
      itemCount: daysinmonth,
      itemBuilder: (context, index) {
        final date = DateTime(month.year, month.month, index + 1);
        final isSelected =
            selectedDate != null &&
            date.year == selectedDate!.year &&
            date.month == selectedDate!.month &&
            date.day == selectedDate!.day;
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
          isSelected: isRangeStart || isRangeEnd,
          isInRange: isInRange,
          isRangeStart: isRangeStart,
          isRangeEnd: isRangeEnd,
          onTap: () => onDateTap(date),
        );
      },
    );
  }
}

bool _isSameDay(DateTime a, DateTime b) {
  return a.year == b.year && a.month == b.month && a.day == b.day;
}
