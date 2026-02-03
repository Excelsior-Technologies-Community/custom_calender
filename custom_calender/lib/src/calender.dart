import 'package:flutter/material.dart';
import 'event.dart';
import 'range_picker.dart';
import 'widgets/calender_grid.dart';
import 'widgets/calender_header.dart';
import 'widgets/week_days.dart';

class CustomCalender extends StatefulWidget {
  final DateTime initialDate;
  final List<CalendarEvent> events;
  final List<DateTime> holidays;
  final ValueChanged<CalendarEvent>? onEventAdded;

  const CustomCalender({
    super.key,
    required this.initialDate,
    this.events = const [],
    this.holidays = const [],
    this.onEventAdded,
  });

  @override
  State<CustomCalender> createState() => _CustomCalenderState();
}

class _CustomCalenderState extends State<CustomCalender> {
  final DateTime _today = DateTime.now();

  late DateTime _currentMonth;
  DateTime? _selectedDate;

  final DateRangeController _rangeController = DateRangeController();

  @override
  void initState() {
    super.initState();
    DateTime.now();
    _currentMonth = DateTime(_today.year, _today.month);
    _selectedDate = _today;
  }

  @override
  Widget build(BuildContext context) {
    final selectedDay = _selectedDate ?? _today;

    final dayEvents = widget.events
        .where((e) => _isSameDay(e.dateTime, selectedDay))
        .toList();

    return Column(
      children: [
        CalenderHeader(
          title: "${_currentMonth.month}/${_currentMonth.year}",
          onNext: _next,
          onPrevious: _prev,
        ),
        const SizedBox(height: 8),
        const WeekDays(),
        const SizedBox(height: 8),

        Center(
          child: CalenderGrid(
            month: _currentMonth,
            today: _today,
            selectedDate: _selectedDate,
            rangeController: _rangeController,
            events: widget.events,
            holidays: widget.holidays,
            onDateTap: _onTap,
          ),
        ),

        const SizedBox(height: 16),
        const Text(
          "Schedule",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),

        Expanded(
          child: dayEvents.isEmpty
              ? const Center(child: Text("No events"))
              : ListView.builder(
                  itemCount: dayEvents.length,
                  itemBuilder: (_, i) {
                    final event = dayEvents[i];
                    return ListTile(
                      title: Text(event.title),

                      subtitle: Text(
                        "${event.dateTime.day}/${event.dateTime.month}/${event.dateTime.year}  •  "
                        "${TimeOfDay.fromDateTime(event.dateTime).format(context)}",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  void _onTap(DateTime date) {
    final isWeekend =
        date.weekday == DateTime.saturday || date.weekday == DateTime.sunday;

    final isHoliday = widget.holidays.any((d) => _isSameDay(d, date));

    if (isWeekend || isHoliday) return;

    // 🔥 If same date tapped again → unselect
    if (_selectedDate != null && _isSameDay(_selectedDate!, date)) {
      setState(() {
        _selectedDate = null;
        _rangeController.reset();
      });
      return;
    }

    _rangeController.onDateTap(date);

    setState(() {
      _selectedDate = date;
    });

    _openBottomSheet(date);
  }

  Future<void> _openBottomSheet(DateTime date) async {
    final controller = TextEditingController();
    TimeOfDay time = TimeOfDay.now();

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Add Event",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: controller,
                decoration: const InputDecoration(hintText: "Event title"),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () async {
                  final t = await showTimePicker(
                    context: context,
                    initialTime: time,
                  );
                  if (t != null) time = t;
                },
                child: const Text("Pick Time"),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  if (controller.text.isEmpty) return;

                  final dt = DateTime(
                    date.year,
                    date.month,
                    date.day,
                    time.hour,
                    time.minute,
                  );

                  widget.onEventAdded?.call(
                    CalendarEvent(dateTime: dt, title: controller.text),
                  );

                  Navigator.pop(context);
                },
                child: const Text("Confirm"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _next() => setState(
    () => _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1),
  );

  void _prev() => setState(
    () => _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1),
  );
}

bool _isSameDay(DateTime a, DateTime b) =>
    a.year == b.year && a.month == b.month && a.day == b.day;
