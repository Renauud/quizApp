class Question {
  final String question;
  final String answer;
  final List<String> multipleChoices;

  Question(this.multipleChoices,
      {required this.question, required this.answer});

  String getQuestion() {
    return question;
  }

  String getAnswer() {
    return answer;
  }

  List<String> getChoices() {
    return multipleChoices;
  }

  int getChoicesNumber() {
    return multipleChoices.length;
  }
}
