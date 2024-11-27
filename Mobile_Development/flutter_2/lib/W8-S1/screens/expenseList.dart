import 'package:flutter/material.dart';
import 'package:flutter_2/W8-S1/models/expense.dart';


class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Text(index.toString() + " - " + expenses[index].title),
    );
  }
}