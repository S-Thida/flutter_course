import 'package:flutter/material.dart';

 void main() {
   runApp(MaterialApp(
     home: Container(
      margin: const EdgeInsets.all(50),
      padding: const EdgeInsets.all(40),
      color:  const Color(0xFF64B5F6),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: const Color(0xFF1E88E5) ),
        child: const Center(
          child: Text('CADT STUDENTS',style: TextStyle(color: Colors.white, fontSize: 35, decoration: TextDecoration.none)
        ),
      )
    ),
    
   ),
   ));
 }
 // In this exercise, we haven’t used the Scaffold widget: Why? What is the purpose of this widget?
 // We havent use Scaffold because the exercise is focused on Container widget’s styling and layout options without additional layout components. 
 //However, It's used to create a consistent app skeleton and provides a pre-designed app bar, body area, and other essential components.