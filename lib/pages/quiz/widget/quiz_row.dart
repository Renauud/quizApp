import 'package:flutter/material.dart';
import 'package:quizapp/entities/quiz.dart';
import 'package:quizapp/routes/route.dart';

class QuizRow extends StatelessWidget {
  const QuizRow({
    Key? key,
    required this.quiz,
  }) : super(key: key);

  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: InkWell(
        onTap: () {
          quiz.reset();
          Navigator.pushNamed(
            context,
            Routes.quizPage,
            arguments: quiz,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(204, 204, 255, 1),
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  quiz.getTitle(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
