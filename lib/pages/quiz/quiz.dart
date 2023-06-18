import 'package:flutter/material.dart';

class QuizQuestions extends StatefulWidget {
  const QuizQuestions();

  @override
  State<StatefulWidget> createState() => QuizQuestionsState();
}

class QuizQuestionsState extends State<QuizQuestions> {
  late final TextEditingController controller;
  bool coloring = false;
  String selectedChoice = "";

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
