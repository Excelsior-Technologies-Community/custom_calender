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

---
## ✨ Feature Preview

- ✅ Today auto-selected (blue highlight)
- ✅ Range selection (purple start/end + light middle)
- ✅ Event dot under date
- ✅ Schedule view below calendar
- ✅ Bottom sheet Date/Time picker
- ✅ Weekend lock (optional)
- ✅ Past date disable (optional)
- ✅ User manual holiday lock
- ✅ Scroll only schedule section (calendar stays fixed)

---
## Preview 

//upload video or photo 

---
## 📦 Installation

Add this to your pubspec.yaml:
```
dependencies:
  custom_calender:
    git:
      url: https://github.com/jaypanchal1014/custom_calender.git
```
Then run:
```
flutter pub get
```
---

## 📂 File Structure
```
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
```
---

## 🚀 Usage
```
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
```
---

## 📄 License
MIT License
```
Copyright (c) 2026

Permission is hereby granted, free of charge, to any person obtaining a copy
of this Custom Calender library and associated documentation files
(the "Software"), to deal in the Software without restriction...
```
