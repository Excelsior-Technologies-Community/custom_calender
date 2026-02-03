import 'package:flutter/material.dart';

class DayCell extends StatelessWidget {
  final int day;
  final bool isToday;
  final bool isSelected;
  final bool isRangeStart;
  final bool isRangeEnd;
  final bool isInRange;
  final bool hasEvent;
  final bool isDisabled;
  final Color? eventColor;
  final VoidCallback onTap;

  const DayCell({
    super.key,
    required this.day,
    required this.onTap,
    this.isToday = false,
    this.isSelected = false,
    this.isRangeStart = false,
    this.isRangeEnd = false,
    this.isInRange = false,
    this.hasEvent = false,
    this.isDisabled = false,
    this.eventColor,
  });

  @override
  Widget build(BuildContext context) {
    Color bg = Colors.transparent;
    Color text = Colors.black;

    if (isDisabled) {
      text = Colors.grey;
    } else if (isRangeStart || isRangeEnd) {
      bg = const Color(0xFF6A1B9A);
      text = Colors.white;
    } else if (isInRange) {
      bg = const Color(0xFFD1C4E9);
    } else if (isToday || isSelected) {
      bg = const Color(0xFF1976D2);
      text = Colors.white;
    }

    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              day.toString(),
              style: TextStyle(color: text, fontWeight: FontWeight.w600),
            ),
            if (hasEvent && !isDisabled)
              Positioned(
                bottom: 4,
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: eventColor ?? Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
