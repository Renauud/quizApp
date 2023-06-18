import 'package:flutter/material.dart';
import 'package:quizapp/entities/quiz.dart';
import 'package:quizapp/entities/quiz_list.dart';
import 'package:quizapp/pages/quiz/widget/quiz_row.dart';

class ListQuiz extends StatefulWidget {
  const ListQuiz({
    super.key,
  });

  @override
  State<ListQuiz> createState() => ListQuizState();
}

class ListQuizState extends State<ListQuiz> {
  late final TextEditingController controller;

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Application Quiz"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              for (Quiz item in quizList)
                QuizRow(
                  quiz: item,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
