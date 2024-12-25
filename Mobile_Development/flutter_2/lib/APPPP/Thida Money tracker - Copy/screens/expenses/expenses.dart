import 'package:flutter/material.dart';
 
import '../../models/expense.dart';
import 'expenses_form.dart';
import 'expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [];
 


  void onExpenseRemoved(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  void onExpenseCreated(Expense newExpense) {
    setState(() {
      _registeredExpenses.add(newExpense);
    });
  }
 

  void onAddPressed() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => ExpenseForm(onCreated: onExpenseCreated,),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: onAddPressed,
          )
        ],
        backgroundColor: const Color.fromARGB(255, 106, 106, 106),
        title: const Text('Thida\'s Money Tracker'),
      ),
      body: ExpensesList(expenses: _registeredExpenses, onExpenseRemoved: onExpenseRemoved,),
    );
  }
}

