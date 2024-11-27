import 'quiz.dart';

class Answer {
  String questionAnswer;
  Question question;
  Answer({required this.questionAnswer, required this.question});
  bool isCorrect() {
    return questionAnswer == question.goodAnswer;
  }
}

class Submission {
  List<Answer> answers = [];
  int getScore() {
    int score = 0;
    for (Answer answer in answers) {
      if (answer.isCorrect()) {
        score++;
      }
    }
    return score;
  }

  Answer? getAnswerFor(Question question) {
    for (Answer answer in answers) {
      if (answer.question == question) {
        return answer;
      }
    }
    return null;
  }

  void addAnswer(Question question, String answer) {
    if (getAnswerFor(question) == null) {
      answers.add(Answer(question: question, questionAnswer: answer));
    }
  }

  void removeAnswer() {
    answers.clear();
  }
}
