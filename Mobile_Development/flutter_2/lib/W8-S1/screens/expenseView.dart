import 'package:flutter/material.dart';
import 'package:flutter_2/W8-S1/models/expense.dart';
import 'package:flutter_2/W8-S1/screens/expenseList.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  final List<Expense> _registerExpense=[
Expense(
      title: 'Lunch at the café',
      amount: 15.50,
      date: DateTime(2024, 11, 1),
      expenseType: ExpenseType.FOOD,
    ),
    Expense(
      title: 'Flight to Paris',
      amount: 450.00,
      date: DateTime(2024, 11, 5),
      expenseType: ExpenseType.TRAVEL,
    ),
    Expense(
      title: 'Concert tickets',
      amount: 75.00,
      date: DateTime(2024, 11, 10),
      expenseType: ExpenseType.LEISURE,
    ),
    Expense(
      title: 'Office supplies',
      amount: 30.00,
      date: DateTime(2024, 11, 15),
      expenseType: ExpenseType.WORK,
    ),
    Expense(
      title: 'Dinner with friends',
      amount: 50.00,
      date: DateTime(2024, 11, 18),
      expenseType: ExpenseType.FOOD,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App bar'),
        backgroundColor: Colors.blue,
      ),
      
        body: ExpensesList(expenses: _registerExpense),
    );
  }
}
