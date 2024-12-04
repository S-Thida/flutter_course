import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onCreated});
  final Function(Expense) onCreated;

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
    // Close modal
    Navigator.pop(context);
  }

  void onAdd() {
    // 1- Get the values from inputs
    String title = _titleController.text;
    double amount = double.parse(_valueController.text);

    // 2- Create the expense
    Expense expense = Expense(
        title: title,
        amount: amount,
        date: _selectedDate ?? DateTime.now(),
        category: _selectedCategory!);

    // 3- Ask the parent to add the expense
    widget.onCreated(expense);

    // 4- Close modal
    Navigator.pop(context);
  }

  void onCategorySelected(Category category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  // 5. Date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate ?? DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2025));
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
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
                  controller: _valueController,
                  decoration: const InputDecoration(
                    prefix: Text('\$ '),
                    label: Text('Amount'),
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () => _selectDate(context),
                icon: const Icon(Icons.calendar_today),
                label: Text(
        _selectedDate == null
            ? 'Select Date'
            : '${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}',
      ),
              ),
            ],
          ),
          const SizedBox( height: 25.5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ExpenseTypelist(
                onCategorySelected: onCategorySelected,
                trigger: onCategorySelected,
              ),
              const Spacer(),
              ElevatedButton(onPressed: onCancel, child: const Text('Cancel')),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: onAdd, child: const Text('Save Expense')),
            ],
          )
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
                Icon(category.icon),
                const SizedBox(width: 10),
                Text(category.name),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
