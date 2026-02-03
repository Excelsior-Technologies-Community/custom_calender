import 'package:custom_calender/src/widgets/day_cell.dart';
import 'package:flutter/widgets.dart';

class CalenderGrid extends StatelessWidget {
  final DateTime month;
  final DateTime? selectedDate;
  final ValueChanged<DateTime> onDateTap;
  const CalenderGrid({
    super.key,
    required this.month,
    required this.selectedDate,
    required this.onDateTap,
  });

  @override
  Widget build(BuildContext context) {
    final daysinmonth = DateTime(month.year,month.month +1,0).day;
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7),
      itemCount: daysinmonth,
      itemBuilder: (context, index) {
        final date =DateTime(month.year,month.month,index +1);
        final isSelected = selectedDate!=null &&
            date.year == selectedDate!.year &&
            date.month == selectedDate!.month &&
            date.day == selectedDate!.day;
        return DayCell(
          day: date.day,
          isSelected: isSelected,
          onTap: () => onDateTap(date),
        );
      },
    );
  }
}