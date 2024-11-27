import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [ 
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromARGB(255, 131, 198, 253),
            ),
            child: const Center(
              child: Text(
                'OOP',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
          
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromARGB(255, 55, 154, 235),
            ),
            child: const Center(
              child:  Text(
                'DART',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
           
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF4EA7F1), Color(0xFF2A207B)],
              ),
            ),
            child: const Center(
              child: Text(
                'FLUTTER',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ));
}



