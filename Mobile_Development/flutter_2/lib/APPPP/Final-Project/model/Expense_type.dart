import 'package:flutter/material.dart';

enum ExpenseType {
  food('food', Color.fromARGB(255, 73, 136, 104)),
  drink('Drink', Color.fromARGB(255, 231, 155, 111)),
  bills('Bills', Color.fromARGB(255, 111, 188, 227)),
  gas('gas', Color.fromARGB(255, 210, 224, 131)),
  shopping('Shopping', Color.fromARGB(255, 224, 131, 170));
final String label;
final Color color; 
const  ExpenseType(this.label, this.color);

}

