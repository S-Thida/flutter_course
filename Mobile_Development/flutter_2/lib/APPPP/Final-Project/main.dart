import 'package:flutter/material.dart';
import 'package:flutter_2/Final-Project/widget/new_expense.dart';

void main() {
  runApp(ExpenseTrackerApp());
}

class ExpenseTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      title: 'Thida\'s Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ,
    );
  }
}
