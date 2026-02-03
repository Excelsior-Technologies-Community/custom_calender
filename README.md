📅 Custom Calender

Custom Calender is a highly customizable Flutter calendar widget that includes:
Date picker
Range picker
Schedule view
Event dots
Holiday locks
Weekend lock
Past date disable
Bottom sheet event creator
Clean Material UI
It is designed to be reusable and fully configurable from the user side.

✨ Feature Preview

✅ Today auto-selected (blue highlight)
✅ Range selection (purple start/end + light middle)
✅ Event dot under date
✅ Schedule view below calendar
✅ Bottom sheet Date/Time picker
✅ Weekend lock (optional)
✅ Past date disable (optional)
✅ User manual holiday lock
✅ Scroll only schedule section (calendar stays fixed)

📦 Installation

Add this to your pubspec.yaml:

dependencies:
  custom_calender:
    git:
      url: https://github.com/yourusername/custom_calender.git


Then run:

flutter pub get

📂 File Structure
custom_calender/
│
├─ lib/
│   ├─ custom_calender.dart        # Main library export file
│   │
│   └─ src/
│       ├─ calender.dart           # Core calendar widget
│       ├─ event.dart              # Event model
│       ├─ range_picker.dart       # Range selection logic
│       ├─ widgets/
│       │    ├─ calender_grid.dart
│       │    ├─ day_cell.dart
│       │    ├─ calender_header.dart
│       │    └─ week_days.dart
│
├─ example/
│   └─ main.dart                   # Example usage
│
├─ pubspec.yaml
├─ README.md
└─ LICENSE

🚀 Usage
import 'package:flutter/material.dart';
import 'package:custom_calender/custom_calender.dart';
import 'package:custom_calender/src/event.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: CustomCalender(
            initialDate: DateTime.now(),
            enableRangeSelection: true,
            disablePastDates: true,
            lockWeekends: true,
            events: [
              CalendarEvent(
                dateTime: DateTime(2026, 2, 5),
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

⚙️ CustomCalender Properties
Property	Type	Required	Default	Description
initialDate	DateTime	✅ Yes	-	Starting month
events	List<CalendarEvent>	No	[]	Event dots data
disablePastDates	bool	No	true	Disable past dates
lockWeekends	bool	No	true	Lock Saturday & Sunday
unlockedDates	List<DateTime>	No	[]	Manually unlock specific dates
enableRangeSelection	bool	No	false	Enable range picker
🟣 Range Picker
First tap → Range start (dark purple)
Second tap → Range end (dark purple)
Middle dates → Light purple
Tap again → Reset range

🔵 Event Dot
To add event dot manually:
CalendarEvent(
  dateTime: DateTime(2026, 2, 5),
  color: Colors.blue,
)
Dot automatically appears under that date.

📅 Schedule View
Tap a date
Bottom sheet opens
Add title & time
Confirm

Event appears:
Under Schedule section
As dot on calendar
Holiday Lock

You can:
Disable past dates
Lock weekends
Unlock specific dates manually

Example:
CustomCalender(
  initialDate: DateTime.now(),
  lockWeekends: true,
  disablePastDates: true,
  unlockedDates: [
    DateTime(2026, 2, 8),
  ],
)

🎨 UI Behavior
Calendar stays fixed
Only schedule section scrolls
Today auto-selected
Range color priority over single selection
Disabled dates are greyed out

📌 Version
0.0.1 - Initial Release


Features:
Date picker
Range picker
Schedule view
Event dots
Holiday locks
Weekend lock
Past date disable



📄 License
MIT License

Copyright (c) 2026

Permission is hereby granted, free of charge, to any person obtaining a copy
of this Custom Calender library and associated documentation files
(the "Software"), to deal in the Software without restriction...
