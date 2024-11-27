import 'package:flutter/material.dart';
import 'package:flutter_2/W7-S2-Flutter%20Quiz/lib/model/submission.dart';
import 'model/quiz.dart';
import 'screens/welcome_screen.dart';
import 'screens/result_screen.dart';
import 'screens/question_screen.dart';

enum QuizState { notStarted, started, finished }

Color appColor = Colors.blue[500] as Color;

class QuizApp extends StatefulWidget {
  const QuizApp(this.quiz, {super.key});
  final Quiz quiz;

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  QuizState _quizState = QuizState.notStarted;
  int questionIndex = 0;
  Submission submit = Submission();
  Widget get getScreen {
    switch (_quizState) {
      case QuizState.notStarted:
        return WelcomeScreen(
          onpressed: switchScreen,
        );
      case QuizState.started:
        return QuestionScreen(
          questions: widget.quiz.questions[questionIndex],
          getValue: answerQuestion,
        );
      case QuizState.finished:
        return ResultScreen(
          submission: submit,
          quiz: widget.quiz,
          restart: restartQuiz,
        );
      default:
        return WelcomeScreen(
          onpressed: switchScreen,
        );
    }
  }

  void switchScreen() {
    setState(() {
      _quizState = QuizState.started;
    });
  }

  void answerQuestion(String ans) {
    Question question = widget.quiz.questions[questionIndex];
    submit.addAnswer(question, ans);

    setState(() {
      if (questionIndex < widget.quiz.questions.length - 1) {
        questionIndex++;
      } else {
        _quizState = QuizState.finished;
      }
    });
  }

  void restartQuiz() {
    setState(() {
      questionIndex = 0;
      submit.removeAnswer();
      _quizState = QuizState.notStarted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: appColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[getScreen],
          ),
        ),
      ),
    );
  }
}
