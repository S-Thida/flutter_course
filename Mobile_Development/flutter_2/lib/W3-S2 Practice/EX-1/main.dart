import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp( 
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 240, 216, 224),
        body: Center(
          child: Text('Hii, I am  Thida',style: TextStyle(color: Color.fromARGB(255, 243, 126, 165), fontSize: 50)),
        ),
      ),
    ),
  );
}