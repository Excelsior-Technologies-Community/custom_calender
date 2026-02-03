class DateRangeController {
  DateTime? rangeStart;
  DateTime? rangeEnd;

  void reset() {
    rangeStart = null;
    rangeEnd = null;
  }

  void onDateTap(DateTime date) {
    if (rangeStart == null || rangeEnd != null) {
      rangeStart = date;
      rangeEnd = null;
      return;
    }

    if (date.isBefore(rangeStart!)) {
      rangeEnd = rangeStart;
      rangeStart = date;
    } else {
      rangeEnd = date;
    }
  }

  bool isStart(DateTime date) =>
      rangeStart != null && _isSameDay(rangeStart!, date);

  bool isEnd(DateTime date) => rangeEnd != null && _isSameDay(rangeEnd!, date);

  bool isInRange(DateTime date) {
    if (rangeStart == null || rangeEnd == null) return false;
    return date.isAfter(rangeStart!) && date.isBefore(rangeEnd!);
  }
}

bool _isSameDay(DateTime a, DateTime b) =>
    a.year == b.year && a.month == b.month && a.day == b.day;
