import 'package:flutter/material.dart';
import 'package:quiz_app/models/quiz_questions.dart';
import 'data/theQuestions.dart';
import 'answer_button.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizQuestions extends StatefulWidget {
  final List<Qustionsofquiz> questions;

  const QuizQuestions({
    required this.questions,
    super.key,
    required this.onselectedanswer,
  });
  final void Function(String answer) onselectedanswer;
  @override
  State<QuizQuestions> createState() => _QuizQuestionsState();
}

class _QuizQuestionsState extends State<QuizQuestions> {
  int curruntQuestion = 0;
  void answerquestion(String choosedanswer) {
    widget.onselectedanswer(choosedanswer);
    setState(() {
      curruntQuestion++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              questions[curruntQuestion].question,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 184, 184, 249),
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ...questions[curruntQuestion].getshuffledanswers().map((answer) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: AnswerButton(
                  answerText: answer,
                  onTap: () {
                    answerquestion(answer);
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
