import 'package:flutter/material.dart';
import 'package:quiz_app/data/theQuestions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswers = [];
  var curruntScreen = 1;
  //function that changes the screen so we can use it on the start screen button
  //to get us to the next page
  //its another way instead of using navigator.push
  void switchScreen() {
    setState(() {
      curruntScreen = 2;
    });
  }

  void restartquiz() {
    setState(() {
      curruntScreen = 1;
    });
    selectedAnswers.clear();
  }

  void choosedanswer(String answer) {
    selectedAnswers.add(answer);
    setState(() {
      if (selectedAnswers.length == questions.length) {
        curruntScreen = 3;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //ternary expressions to set the currunt screen
    Widget widgetscreen;
    if (curruntScreen == 1) {
      widgetscreen = StartScreen(switchScreen);
    } else if (curruntScreen == 2) {
      widgetscreen = QuizQuestions(
        questions: questions,
        onselectedanswer: choosedanswer,
      );
    } else {
      widgetscreen = ResultsScreen(
        summarydata: selectedAnswers,
        onTap: restartquiz,
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentGeometry.topLeft,
              end: AlignmentGeometry.bottomRight,
              colors: [
                Color.fromARGB(238, 93, 0, 255),
                Color.fromARGB(238, 99, 9, 255),
              ],
            ),
          ),
          child: widgetscreen,
        ),
      ),
    );
  }
}
