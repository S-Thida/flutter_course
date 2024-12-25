import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
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
  double _currentBalance = 1000.0;
  double _totalExpense=0.0;

  double gotTotalExpense(){
    for(var expenses in _registeredExpenses){
      _totalExpense += expenses.amount; 
    }
    return _totalExpense;
  }

  void onExpenseRemoved(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
      _currentBalance +=
          expense.amount;
      _totalExpense -= expense.amount;
    });
  }

  void onExpenseRestored(Expense expense) {
    setState(() {
      _currentBalance -=
          expense.amount; 
     _totalExpense +=
          expense.amount; 
    });
  }

  void onExpenseCreated(Expense newExpense) {
    setState(() {
      _registeredExpenses.add(newExpense);
      _currentBalance -=
          newExpense.amount; 
          _totalExpense +=
          newExpense.amount; 
    });
  }

  void onAddPressed() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => ExpenseForm(
        onCreated: onExpenseCreated,
        currentBalance: _currentBalance,
        totalBalance: _totalExpense,
      ),
    );
  }

  List<PieChartData2> getPieChartDat2() {
   
    Map<Category, double> categorySums = {};
    for (var expense in _registeredExpenses) {
      categorySums[expense.category] =
          (categorySums[expense.category] ?? 0) + expense.amount;
    }

    return categorySums.entries.map((entry) {
      return PieChartData2(entry.key, entry.value);
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
        backgroundColor: const Color.fromARGB(255, 174, 173, 173),
        title: const Text('Thida\'s Money Tracker'),
      ),
      body: Column(
        children: [
          Padding(
  padding: const EdgeInsets.all(20.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
  Container(
    padding: const EdgeInsets.all(16.0), 
    margin: const EdgeInsets.symmetric(vertical: 8.0), 
    decoration: BoxDecoration(
      
      borderRadius: BorderRadius.circular(8.0), 
      border: Border.all(
        color: Colors.grey, 
        width: 1.0, 
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Current Balance: \$${_currentBalance.toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8), 
        Text(
          'Total Expense: \$${_totalExpense.toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  ),
],

  ),
),
          Center(
            child: SizedBox(
              height: 200,
              child: SfCircularChart(
                
                title: ChartTitle(text: 'Expenses by Category'),
                
                legend: Legend(isVisible: true),
                series: <CircularSeries>[
                  PieSeries<PieChartData2, String>(
                    
                    dataSource: getPieChartDat2(),
                    xValueMapper: (PieChartData2 data, _) => data.category.label,
                    yValueMapper: (PieChartData2 data, _) => data.amount,
                    pointColorMapper: (PieChartData2 data, _) =>data.category.color,
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: ExpensesList(
              expenses: _registeredExpenses,
              onExpenseRemoved: onExpenseRemoved,
              onExpenseRestored: onExpenseRestored,
            ),
          ),
        ],
      ),
    );
  }
}

class PieChartData2 {
  final Category category;
  final double amount;
  

  PieChartData2(this.category, this.amount);
}

class PieChartData1 {
  final Category category;
  final int count;

  PieChartData1(this.category, this.count);
}