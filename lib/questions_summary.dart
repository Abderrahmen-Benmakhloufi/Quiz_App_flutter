import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({required this.summarydata, super.key});
  final List<Map<String, Object>> summarydata;

  @override
  Widget build(BuildContext context) {
    double sreenheight = MediaQuery.of(context).size.height;
    double sreenwidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: sreenheight * 0.5,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: summarydata.map((data) {
            return Row(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    child: CircleAvatar(
                      radius: sreenwidth * 0.05,
                      foregroundColor: Colors.black,
                      backgroundColor: data['choosen'] == data['right']
                          ? Colors.blue[300]
                          : Colors.pink[300],

                      child: Text(
                        ((data['questionindex'] as int) + 1).toString(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        data['question'] as String,
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        data['choosen'] as String,
                        style: GoogleFonts.lato(
                          color: data['choosen'] == data['right']
                              ? Colors.blue[300]
                              : Colors.pink[300],
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        data['right'] as String,
                        style: GoogleFonts.lato(
                          color: Colors.blue[300],
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: sreenheight * 0.03),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
