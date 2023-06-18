import 'package:flutter/material.dart';
import 'package:quizapp/pages/home/home.dart';
import 'package:quizapp/pages/quiz/quiz.dart';
import 'package:quizapp/routes/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        themeMode: ThemeMode.dark,
        initialRoute: Routes.homePage,
        routes: {
          Routes.homePage: (context) => const ListQuiz(),
          Routes.quizPage: (context) => const QuizQuestions(),
        });
  }
}
