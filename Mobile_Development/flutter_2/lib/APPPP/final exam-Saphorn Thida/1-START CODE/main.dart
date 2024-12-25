import 'package:flutter/material.dart';
import 'package:flutter_2/final%20exam/1-START%20CODE/models/course.dart';
import 'package:flutter_2/final%20exam/1-START%20CODE/widgets/courses_view.dart';
import 'package:flutter_2/final%20exam/1-START%20CODE/widgets/course_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.blue,
      title: 'Score App',
 
      home: CourseView(), 
    );
  }
}
