import 'package:flutter/material.dart';

class DayCell extends StatelessWidget {
  final int day;
  final bool isSelected;
  final bool isInRange;
  final bool isRangeStart;
  final bool isRangeEnd;
  final VoidCallback onTap;

  const DayCell({
    super.key,
    required this.day,
    required this.onTap,
    this.isSelected = false,
    this.isInRange = false,
    this.isRangeStart = false,
    this.isRangeEnd = false,
  });

  @override
  Widget build(BuildContext context) {
    Color bg = Colors.transparent;
    Color text = Colors.black;

    if (isRangeStart || isRangeEnd || isSelected) {
      bg = Colors.blue;
      text = Colors.white;
    } else if (isInRange) {
      bg = Colors.blue.withOpacity(0.25);
    }

    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          day.toString(),
          style: TextStyle(color: text, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
