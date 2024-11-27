import 'package:flutter/material.dart';
import 'quiz_app.dart';
import 'model/quiz.dart';

void main() {

  Question q1 = const Question(
      title: "Who is the best teacher?",
      possibleAnswers: ["ronan", "hongly", 'leangsiv'],
      goodAnswer: 'ronan');
  Question q2 = const Question(
      title: "Which color is the best?",
      possibleAnswers: ["blue", "red", 'green'],
      goodAnswer: 'red');
      Question q3 = const Question(
      title: "Describe Teacher Ronan",
      possibleAnswers: ["the best ", "best of the best", "Amazon"],
      goodAnswer: "Amazon");
      Question q4 = const Question(
      title: "Who is the best Student?",
      possibleAnswers: ["Thida", "Danin", 'Nak'],
      goodAnswer: 'Thida');

  List<Question> myQuestions = [q1, q2,q3,q4];
  Quiz myQuiz = Quiz(title: "Crazy Quizz", questions: myQuestions);

  runApp(QuizApp(myQuiz));
}
