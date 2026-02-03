import 'package:flutter/material.dart';
import 'package:custom_calender/custom_calender.dart';

void main (){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child:CustomCalender(
            
            initialDate: DateTime.now(),
            onDateSelected: (date) {
              print('Selected date: $date');
            },
          ),                                                                                                                                                                                                                
      ),
    ));
  }
}