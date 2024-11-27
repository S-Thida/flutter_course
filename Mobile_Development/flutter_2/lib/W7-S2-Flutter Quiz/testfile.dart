import '../W7-S2-Flutter Quiz/lib/model/submission.dart';
import '../W7-S2-Flutter Quiz/lib/model/quiz.dart';

void main() {
  Question q1 = const Question(
      title: "Who is the best teacher?",
      possibleAnswers: ["ronan", "hongly", 'leangsiv'],
      goodAnswer: 'ronan');
  Question q2 = const Question(
      title: "Which color is the best?",
      possibleAnswers: ["blue", "red", 'green'],
      goodAnswer: 'red');

  List<Question> myQuestions = [q1, q2];
  Quiz myQuiz = Quiz(title: "Crazy Quizz", questions: myQuestions);

  Submission submission = Submission();
  submission.addAnswer(q1, "leangsiv");
  submission.addAnswer(q2, "red");

  print("Score: ${submission.getScore()}"); // Output: Score: 20

  Answer? answer = submission.getAnswerFor(q1);
  if (answer != null) {
    print(
        "Answer for Q1: ${answer.questionAnswer}"); // Output: Answer for Q1: ronan
  }

  submission.removeAnswer();
  print(
      "Score after removing answers: ${submission.getScore()}"); // Output: Score after removing answers: 0
}