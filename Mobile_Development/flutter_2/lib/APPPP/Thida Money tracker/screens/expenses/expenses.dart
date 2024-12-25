import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../models/expense.dart'; // Ensure your Expense model includes 'amount' and 'date'
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
  double _currentBalance = 1000.0; // Example starting balance

  void onExpenseRemoved(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
      _currentBalance += expense.amount; // Increase balance when expense is removed
    });
  }

  void onExpenseCreated(Expense newExpense) {
    if (newExpense.amount > _currentBalance) {
      // Show alert if the expense exceeds the current balance
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Insufficient Balance'),
          content: const Text('Current balance is not enough.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }

    setState(() {
      _registeredExpenses.add(newExpense);
      _currentBalance -= newExpense.amount; // Decrease balance when expense is added
    });
  }

  void onAddPressed() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => ExpenseForm(onCreated: onExpenseCreated),
    );
  }

  List<PieChartSectionData> getPieChartData() {
    // Calculate total expenses
    double totalExpenses = _registeredExpenses.fold(0, (sum, item) => sum + item.amount);

    // Group expenses by category
    Map<Category, double> categoryExpenses = {};
    for (var expense in _registeredExpenses) {
      categoryExpenses[expense.category] = (categoryExpenses[expense.category] ?? 0) + expense.amount;
    }

    // Create PieChartSectionData for each category
    return categoryExpenses.entries.map((entry) {
      final percentage = (entry.value / totalExpenses) * 100;
      return PieChartSectionData(
        color: entry.key.color,
        value: entry.value,
        title: '${entry.key.label} (${percentage.toStringAsFixed(1)}%)',
        radius: 60,
      );
    }).toList();
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Current Balance: \$${_currentBalance.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 200,
            child: PieChart(
              PieChartData(
                sections: getPieChartData(),
                borderData: FlBorderData(show: false),
                sectionsSpace: 0,
                centerSpaceRadius: 40,
              ),
            ),
          ),
          Expanded(
            child: ExpensesList(
              expenses: _registeredExpenses,
              onExpenseRemoved: onExpenseRemoved,
            ),
          ),
        ],
      ),
    );
  }
}