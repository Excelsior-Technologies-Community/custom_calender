import 'package:flutter/widgets.dart';

class DayCell extends StatelessWidget {
  final int day;
  final bool isSelected;
  final bool isInRange;
  final bool isRangeStart;
  final bool isRangeEnd;
  final bool isToday;
  final bool hasEvent;
  final Color? eventColor;

  final VoidCallback onTap;

  const DayCell({
    super.key,
    required this.day,
    required this.onTap,
    this.isSelected = false,
    this.isInRange = false,
    this.isRangeStart = false,
    this.isRangeEnd = false,
    this.isToday = false,
    required this.hasEvent,
    this.eventColor,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor = const Color(0x00000000);
    Color textColor = const Color(0xFF000000);
    Border? border;

    // 🔵 RANGE START / END
    if (isRangeStart || isRangeEnd) {
      bgColor = const Color(0xFF6A1B9A); // dark purple
      textColor = const Color(0xFFFFFFFF);
    }
    // 🟣 RANGE MIDDLE
    else if (isInRange) {
      bgColor = const Color(0xFFD1C4E9); // light purple
    }
    // 🔵 SINGLE SELECT
    else if (isSelected) {
      bgColor = const Color(0xFF1976D2);
      textColor = const Color(0xFFFFFFFF);
    }
    // 🟢 TODAY (only if not selected / range)
    // else if (isToday) {
    //   border = Border.all(color: const Color(0xFF2E7D32), width: 2);
    //   textColor = const Color(0xFF2E7D32);
    // }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44,
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
          border: border,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // 🔹 DATE TEXT (always center)
            Text(
              day.toString(),
              style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
            ),

            // 🔹 EVENT DOT (absolute bottom)
            if (hasEvent && !isToday)
              Positioned(
                bottom: 4,
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: eventColor ?? const Color(0xFF1976D2),
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
