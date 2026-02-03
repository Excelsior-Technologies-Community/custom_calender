import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CalenderHeader extends StatelessWidget {
  final String title;
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  const CalenderHeader({
    super.key,
    required this.title,
    required this.onNext,
    required this.onPrevious,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: onPrevious, icon: Icon(Icons.chevron_left)),
        Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        IconButton(onPressed: onNext, icon: Icon(Icons.chevron_right)),
      ],
    );
  }
}
