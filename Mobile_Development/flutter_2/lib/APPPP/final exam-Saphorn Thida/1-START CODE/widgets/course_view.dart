import 'package:flutter/material.dart';
import 'package:flutter_2/W6-S2-PRACTICE/EXERCISE-1/ex_1_start.dart';
import 'package:flutter_2/final%20exam/1-START%20CODE/models/course.dart';


class CourseView extends StatelessWidget {
  CourseView
 (this.scores, {super.key});

  final StudentScore scores;
 
 
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          child: ListView.builder(
              itemCount: scores.length,
              itemBuilder: (context, index) {
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      scores.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text('\$${scores.score.toStringAsFixed(2)}'),
                  ],
                );
              })),
    );
  }
}
