
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/services.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm(
      {super.key, required this.onCreated, required this.currentBalance, required this.totalBalance});
  final Function(Expense) onCreated;
  final double currentBalance;
  final double totalBalance;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  Category? _selectedCategory;
  DateTime? _selectedDate;

  String get title => _titleController.text;

  @override
  void dispose() {
    _titleController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  void onCancel() {
    Navigator.pop(context);
  }

  void onAdd() {
    String title = _titleController.text;
    double amount = double.tryParse(_valueController.text) ?? 0;

    if (title.isEmpty  || amount <= 0 ||_selectedCategory == null ) {
      // Show alert if validation fails
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text('Please fill in all fields correctly.'),
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

    Expense expense = Expense(
      title: title,
      amount: amount,
      date: DateTime.now(),
      category: _selectedCategory!,
    );

    if (expense.amount > widget.currentBalance) {
     
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

    widget.onCreated(expense);
    Navigator.pop(context);
  }

  void onCategorySelected(Category category) {
    setState(() {
      _selectedCategory = category;
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
                  controller: _valueController,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: const InputDecoration(
                    prefix: Text('\$ '),
                    label: Text('Amount'),
                  ),
                ),
              ),
              
            ],
          ),
          const SizedBox(height:30),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ExpenseTypelist(
                onCategorySelected: onCategorySelected,
                trigger: onCategorySelected,
              ),
              const Spacer(),
              ElevatedButton(onPressed: onCancel, child: Text('Cancel', style: TextStyle(color: Colors.black),),
               style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 223, 221, 221),
              ),),
              const SizedBox(width: 20),
              ElevatedButton(
                  onPressed: onAdd, child: const Text('Save Expense', style: TextStyle(color: Colors.black),),
                  style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 232, 231, 231),
              ),),
            ],
          ),
        ],
      ),
    );
  }
}

class ExpenseTypelist extends StatefulWidget {
  final Function(Category) trigger;
  const ExpenseTypelist(
      {super.key, required onCategorySelected, required this.trigger});

  @override
  State<ExpenseTypelist> createState() => _ExpenseTypelistState();
}

class _ExpenseTypelistState extends State<ExpenseTypelist> {
  Category? selectType;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<Category>(
        
        hint: const Text('Expense Type'),
        value: selectType,
        onChanged: (Category? newValue) {
          setState(() {
            selectType = newValue;
            widget.trigger(selectType!);
          });
        },
        items: Category.values
            .map<DropdownMenuItem<Category>>((Category category) {
          return DropdownMenuItem<Category>(
            value: category,
            child: Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: category.color,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 10),
                Text(category.label),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}