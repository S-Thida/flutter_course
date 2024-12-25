import 'package:flutter/material.dart';
import '../../models/expense.dart';
import 'expenses_item.dart';

class ExpensesList extends StatefulWidget {
  const ExpensesList(
      {super.key,
      required this.expenses,
      required this.onExpenseRemoved,
      required this.onExpenseRestored});

  final List<Expense> expenses;
  final Function(Expense) onExpenseRemoved;
  final Function(Expense) onExpenseRestored;

  @override
  _ExpensesListState createState() => _ExpensesListState();
}

class _ExpensesListState extends State<ExpensesList> {
  Expense? _recentlyDeletedExpense;
  int? _recentlyDeletedExpenseIndex;

  void _reorderableList(int oldIndex, int newIndex){
setState(() {
  if (newIndex > oldIndex){
    newIndex -=1;
    final item= widget.expenses.removeAt(oldIndex);
    widget.expenses.insert(newIndex, item);
  }
});
  }

  void _removeExpense(int index) {
    setState(() {
      _recentlyDeletedExpense = widget.expenses[index];
      _recentlyDeletedExpenseIndex = index;
      widget.expenses.removeAt(index);
    });

    widget.onExpenseRemoved(_recentlyDeletedExpense!);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              widget.expenses.insert(
                  _recentlyDeletedExpenseIndex!, _recentlyDeletedExpense!);
              widget.onExpenseRestored(_recentlyDeletedExpense!);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: widget.expenses.isEmpty
      
          ? const Center(
              child: Text(
                'No expense found, start adding!',
                style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 49, 49, 49)),
              ),
            )
          : ReorderableListView.builder(
            key: const PageStorageKey(''),
            onReorder: _reorderableList,
              itemCount: widget.expenses.length,
              itemBuilder: (context, index) => Dismissible(
                key: Key(widget.expenses[index].id),
                onDismissed: (direction) => _removeExpense(index),
                child: ExpenseItem(widget.expenses[index]),
              ),
            ),
    );
  }
}