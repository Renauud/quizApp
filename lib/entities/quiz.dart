import 'package:quizapp/entities/questions.dart';

class Quiz {
  final String title;
  final List<Question> questions;
  int questionNumber = 0;
  double score = 0;
  int nbTry = 0;

  Quiz({required this.title, required this.questions});

  String getTitle() {
    return title;
  }

  List<Question> getQuestions() {
    return questions;
  }

  int getQuizLength() {
    return questions.length;
  }

  reset() {
    questionNumber = 0;
    score = 0;
    nbTry = 0;
  }
}
