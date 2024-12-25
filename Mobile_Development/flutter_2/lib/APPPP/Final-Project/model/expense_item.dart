 import'package:flutter_2/Final-Project/model/Expense_type.dart';

class ExpenseItem {
  final String name;
  final double amount;
  final DateTime dateTime;
 
  final ExpenseType category;

  ExpenseItem(
      {required this.name, required this.amount, required this.dateTime, required this.category});
}
