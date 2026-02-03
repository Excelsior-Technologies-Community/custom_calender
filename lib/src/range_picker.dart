class DateRangeController {
  DateTime? rangeStart;
  DateTime? rangeEnd;

  bool get isComplete => rangeStart != null && rangeEnd != null;

  void reset() {
    rangeStart = null;
    rangeEnd = null;
  }

  void onDateTap(DateTime date) {
    // 🔁 Same start tapped again → reset
    if (rangeStart != null &&
        rangeEnd == null &&
        _isSameDay(rangeStart!, date)) {
      reset();
      return;
    }

    // 🔁 If range complete → start new range
    if (rangeStart != null && rangeEnd != null) {
      rangeStart = date;
      rangeEnd = null;
      return;
    }

    // Start new range
    if (rangeStart == null) {
      rangeStart = date;
      return;
    }

    // Set range end
    if (date.isBefore(rangeStart!)) {
      rangeEnd = rangeStart;
      rangeStart = date;
    } else {
      rangeEnd = date;
    }
  }

  bool isInRange(DateTime date) {
    if (rangeStart == null || rangeEnd == null) return false;
    return date.isAfter(rangeStart!) && date.isBefore(rangeEnd!);
  }

  bool isStart(DateTime date) {
    return rangeStart != null && _isSameDay(rangeStart!, date);
  }

  bool isEnd(DateTime date) {
    return rangeEnd != null && _isSameDay(rangeEnd!, date);
  }
}

bool _isSameDay(DateTime a, DateTime b) {
  return a.year == b.year && a.month == b.month && a.day == b.day;
}
