import 'package:flutter/material.dart';
import 'package:flutter_2/Money_tracker/screens/expenses/welcome_screen.dart';
import 'screens/expenses/expenses.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    ),
  );
}
