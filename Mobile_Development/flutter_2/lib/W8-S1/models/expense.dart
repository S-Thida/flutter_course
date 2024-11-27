
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

enum ExpenseType{ FOOD, TRAVEL, LEISURE, WORK}
const Uuid uuid = Uuid();
class Expense {
   String id;
  final String title;
  final double amount;
  final DateTime date;
  ExpenseType expenseType;
   Expense({ required this.title, required this.amount, required this.date, required this.expenseType}):this.id= uuid.v4();

 
}
