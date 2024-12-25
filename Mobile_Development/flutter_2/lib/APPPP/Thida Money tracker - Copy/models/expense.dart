import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category {
 
  food('food', Color.fromARGB(255, 73, 136, 104)),
  drink('Drink', Color.fromARGB(255, 231, 155, 111)),
  bills('Bills', Color.fromARGB(255, 111, 188, 227)),
  gas('gas', Color.fromARGB(255, 210, 224, 131)),
  shopping('Shopping', Color.fromARGB(255, 224, 131, 170));

final String label;
final Color color; 
const  Category (this.label, this.color);

}


class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  @override
  String toString() {
    return "Expense $title , amount $amount";
  }
}
