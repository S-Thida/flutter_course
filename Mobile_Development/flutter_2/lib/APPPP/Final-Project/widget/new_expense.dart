
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_2/Final-Project/model/Expense_type.dart';
import 'package:flutter_2/Final-Project/model/expense_item.dart';
import 'package:flutter_2/Final-Project/widget/expanse_list.dart';
import 'package:flutter_2/Final-Project/widget/expense_form.dart';

class Expensescreen extends StatefulWidget {
  const Expensescreen({super.key,required this.onCreated});
  final Function(ExpenseItem) onCreated;

  @override
  State<Expensescreen> createState() => _ExpensescreenState();
}

class _ExpensescreenState extends State<Expensescreen> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  ExpenseType? _selectedExpense;

  String get title => _titleController.text;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void onCancel() {
    // Close modal
    Navigator.pop(context);
  }

  void onAdd() {
    // 1- Get the values from inputs
    String title = _titleController.text;
    double amount = double.parse(_amountController.text);

    // 2- Create the expense
    ExpenseItem expense = ExpenseItem(
      name: title,
      amount: amount,
      dateTime: DateTime.now(),
      category: _selectedExpense!,
    );

    // 3- Ask the parent to add the expense
    widget.onCreated(expense);

    // 4- Close modal
    Navigator.pop(context);
  }

  void onExpensetypeSelected(ExpenseType expenseCategory) {
    setState(() {
      _selectedExpense = expenseCategory;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: _amountController,
                  decoration: const InputDecoration(
                    prefix: Text('\$ '),
                    label: Text('Amount'),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ExpenseTypelist(
                onExpensetypeSelected: onExpensetypeSelected,
              ),
              const Spacer(),
              ElevatedButton(onPressed: onCancel, child: const Text('Cancel')),
              const SizedBox(width: 20),
              ElevatedButton(onPressed: onAdd, child: const Text('Save Expense')),
            ],
          )
        ],
      ),
    );
  }
}

class ExpenseTypelist extends StatefulWidget {
  final Function(ExpenseType) onExpensetypeSelected;

  const ExpenseTypelist({super.key, required this.onExpensetypeSelected});

  @override
  State<ExpenseTypelist> createState() => _ExpenseTypelistState();
}

class _ExpenseTypelistState extends State<ExpenseTypelist> {
  ExpenseType? selectType;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<ExpenseType>(
        hint: const Text('Expense Type'),
        value: selectType,
        onChanged: (ExpenseType? newValue) {
          setState(() {
            selectType = newValue;
            if (selectType != null) {
              widget.onExpensetypeSelected(selectType!);
            }
          });
        },
        items: ExpenseType.values.map<DropdownMenuItem<ExpenseType>>((ExpenseType expenseCategory) {
          return DropdownMenuItem<ExpenseType>(
            value: expenseCategory,
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  color: expenseCategory.color,
                ),
                const SizedBox(width: 10),
                Text(expenseCategory.label),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}