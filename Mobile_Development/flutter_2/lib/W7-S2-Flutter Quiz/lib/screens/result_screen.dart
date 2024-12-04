import 'package:flutter/material.dart';
import 'package:flutter_2/W7-S2-Flutter%20Quiz/lib/model/quiz.dart';
import 'package:flutter_2/W7-S2-Flutter%20Quiz/lib/model/submission.dart';
import 'package:flutter_2/W7-S2-Flutter%20Quiz/lib/widgets/app_button.dart';

class ResultScreen extends StatelessWidget {
  final Submission submission;
  final Quiz quiz;
  final VoidCallback restart;

  const ResultScreen({
    super.key,
    required this.submission,
    required this.quiz,
    required this.restart,
  });

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'You answered ${submission.getScore()} out of ${quiz.questions.length}!',
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        SizedBox(
          height: 500,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: quiz.questions.length,
            itemBuilder: (context, index) {
              final question = quiz.questions[index];
              final userAnswer = submission.getAnswerFor(question)?.questionAnswer;
          
              // Determine colors for question number
              Color numberColor = userAnswer == question.goodAnswer ? Colors.green : Colors.red;
          
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      Text(
                        '${index + 1}',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: numberColor),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        question.title,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8.0),
                      // Display all possible answers
                      ...question.possibleAnswers.map((answer) {
                        bool isUserAnswer = answer == userAnswer;
                        bool isCorrectAnswer = answer == question.goodAnswer;
                        
                        return Row(
                          children: [
                            if (isCorrectAnswer)
                              const Icon(Icons.check, color: Colors.green)
                            else if (isUserAnswer)
                              const Icon(Icons.close, color: Colors.red)
                            else
                              const SizedBox(width: 24), // Placeholder for icon space
                            Expanded(
                              child: Text(
                                answer,
                                style: TextStyle(
                                  color: isUserAnswer
                                      ? Colors.black // User's wrong answer
                                      : isCorrectAnswer
                                          ? Colors.green // Correct answer
                                          : Colors.black, // Other answers
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 20,),
        AppButton(icon: Icons.restart_alt, 'Restart Quiz', onTap: restart)
      ],
    );
  }
}