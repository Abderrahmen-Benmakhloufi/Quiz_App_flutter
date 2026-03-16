import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/theQuestions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    required this.onTap,
    required this.summarydata,
    super.key,
  });
  final List<String> summarydata;
  final void Function() onTap;

  List<Map<String, Object>> getquestioninfo() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < summarydata.length; i++) {
      summary.add({
        'questionindex': i,
        'question': questions[i].question,
        'right': questions[i].answers[0],
        'choosen': summarydata[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numofquestions = questions.length;
    final summarylist = getquestioninfo();
    //The .where() method is used to check if certain conditions are fulfilled.
    //The variable data represents an individual element of the list or map, and we use it to compare, analyze, or filter the collection.
    final numcorrectanswers = summarylist.where((data) {
      return data['right'] == data['choosen'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You Answerd $numcorrectanswers out of $numofquestions questions correctly!',
            style: GoogleFonts.lato(
              color: Colors.blueGrey[200],
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          QuestionsSummary(summarydata: getquestioninfo()),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 60),
            child: Padding(
              padding: const EdgeInsetsGeometry.symmetric(vertical: 20),
              child: TextButton.icon(
                style: const ButtonStyle(
                  side: WidgetStatePropertyAll(
                    BorderSide(color: Colors.white38, width: 2),
                  ),
                ),
                onPressed: onTap,
                label: Text(
                  'Restart quiz',
                  style: GoogleFonts.lato(
                    color: Colors.blueGrey[100],
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                icon: Icon(
                  Icons.restart_alt_outlined,
                  color: Colors.blueGrey[100],
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
