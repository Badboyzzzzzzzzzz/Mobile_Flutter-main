import 'package:flutter/material.dart';
import 'screens/question_screen.dart';
import 'screens/result_screen.dart';
import 'screens/welcome_screen.dart';
import 'model/quiz.dart';
import 'model/submission.dart';

Color appColor = Colors.blue[500] as Color;

class QuizApp extends StatefulWidget {
  const QuizApp(this.quiz, {super.key});

  final Quiz quiz;

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  QuizState quizState = QuizState.not_started;
  int currentQuestionIndex = 0;
  Submission submission = Submission();

  void onStart() {
    setState(() {
      quizState = QuizState.started;
    });
  }

  void onRestart() {
    setState(() {
      quizState = QuizState.not_started;
      currentQuestionIndex = 0;
      submission.removeAnswers();
    });
  }

  void onTap(String selectedAnswer) {
    setState(() {
      final currentQuestion = widget.quiz.questions[currentQuestionIndex];
      submission.addAnswer(currentQuestion, selectedAnswer);

      if (currentQuestionIndex < widget.quiz.questions.length - 1) {
        currentQuestionIndex++;
      } else {
        quizState = QuizState.finished;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screen;

    switch (quizState) {
      case QuizState.not_started:
        screen = WelcomeScreen(
          onStart: () {
            onStart();
          },
        );
        break;
      case QuizState.started:
        final currentQuestion = widget.quiz.questions[currentQuestionIndex];
        screen = QuestionScreen(
          question: currentQuestion,
          onTap: (selectedAnswer) {
            onTap(selectedAnswer);
          },
        );
        break;
      case QuizState.finished:
        screen = ResultScreen(
          onRestart: () {
            onRestart();
          },
          submission: submission,
          quiz: widget.quiz,
        );
        break;
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: appColor,
        body: screen,
      ),
    );
  }
}

enum QuizState {
  // ignore: constant_identifier_names
  not_started,
  started,
  finished,
}
