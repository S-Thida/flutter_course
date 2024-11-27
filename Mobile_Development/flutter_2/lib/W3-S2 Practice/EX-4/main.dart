


import 'package:flutter/material.dart';

void main() {
    runApp(MaterialApp(
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(30),
          child: const Column(
            children: [
              CustomCard(title: 'OOP', color: Color.fromARGB(255, 131, 198, 253)),
              CustomCard(title: 'DART', color: Color.fromARGB(255, 55, 154, 235)),
              CustomCard.gradient(title: 'FLUTTER', colors: [Color(0xFF4EA7F1), Color(0xff083ABA)]),
            ],
          ),
        ),
      ),
    ));
  
}

class CustomCard extends StatelessWidget {
  final String title;
  final Color? color; 
  final List<Color>? colors; 

  const CustomCard({super.key, required this.title, required this.color}): colors = null; 

  const CustomCard.gradient({super.key,required this.title,required this.colors}) : color = null; 

  @override
  Widget build(BuildContext context) {
    return Container(
       margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: color,
        gradient: colors != null ? LinearGradient(colors: colors!) : null,
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 35,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}