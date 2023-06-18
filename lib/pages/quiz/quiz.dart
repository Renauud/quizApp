import 'package:flutter/material.dart';
import 'package:quizapp/entities/quiz.dart';
import 'package:quizapp/pages/quiz/widget/questions_row.dart';
import 'package:quizapp/pages/quiz/widget/quiz_row.dart';

class QuizQuestions extends StatefulWidget {
  const QuizQuestions({super.key});

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
    final quiz = ModalRoute.of(context)!.settings.arguments as Quiz;

    return Scaffold(
      appBar: AppBar(
        title: Text(quiz.getTitle()),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: (() {
            if (quiz.questionNumber == quiz.getQuizLength()) {
              return Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          quiz.reset();
                          Navigator.pop(context);
                        },
                        child: const Text("Retourner à l'accueil."),
                      ),
                    ],
                  ),
                ],
              );
            } else {
              return Column(
                children: [
                  if (quiz.getQuizLength() > quiz.questionNumber)
                    QuestionRow(
                      question: quiz.getQuestions()[quiz.questionNumber],
                    ),
                  if (quiz
                          .getQuestions()[quiz.questionNumber]
                          .getChoicesNumber() ==
                      0)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: TextField(
                            controller: controller,
                            decoration: InputDecoration(
                              labelText: "Écriver votre réponse ici !",
                            ),
                          ),
                        ),
                        Flexible(
                          child: IconButton(
                              icon: const Icon(Icons.arrow_drop_down),
                              onPressed: () {
                                final answer =
                                    controller.text.toUpperCase().trim();
                                if (answer !=
                                        quiz
                                            .getQuestions()[quiz.questionNumber]
                                            .getAnswer() &&
                                    quiz.nbTry < 2) {
                                  quiz.nbTry++;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          "La réponse est ${quiz.getQuestions()[quiz.questionNumber]}"),
                                    ),
                                  );
                                } else {
                                  if (quiz.nbTry == 0) {
                                    quiz.score++;
                                  } else if (quiz.nbTry == 1) {
                                    quiz.score += .5;
                                  }
                                  quiz.questionNumber++;
                                  quiz.nbTry = 0;
                                  controller.clear();
                                  setState(() {});
                                }
                              }),
                        )
                      ],
                    ),
                  if (quiz
                          .getQuestions()[quiz.questionNumber]
                          .getChoicesNumber() >
                      0)
                    Column(
                      children: [
                        for (final String item in quiz
                            .getQuestions()[quiz.questionNumber]
                            .multipleChoices)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            child: InkWell(
                              onTap: () {
                                selectedChoice = item;
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: coloring ? Colors.purple : Colors.red,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 10,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(item),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (selectedChoice !=
                                        quiz
                                            .getQuestions()[quiz.questionNumber]
                                            .getAnswer() &&
                                    quiz.nbTry < 2) {
                                  quiz.nbTry++;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          "La réponse est ${quiz.getQuestions()[quiz.questionNumber].getAnswer()}"),
                                    ),
                                  );
                                } else {
                                  if (quiz.nbTry == 0) {
                                    quiz.score++;
                                  } else if (quiz.nbTry == 1) {
                                    quiz.score += .5;
                                  }
                                  quiz.questionNumber++;
                                  quiz.nbTry = 0;
                                  setState(() {});
                                }
                              },
                              child: const Text("Valider"),
                            )
                          ],
                        )
                      ],
                    )
                ],
              );
            }
          }()),
        ),
      ),
    );
  }
}
