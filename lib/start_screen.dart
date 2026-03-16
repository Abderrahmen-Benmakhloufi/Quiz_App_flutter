import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  //you can name the function that comes from outside whatever you want
  //so when it comes it starts working whatever you wanted it to
  const StartScreen(this.startquiz, {super.key});
  final void Function() startquiz;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/quesmarks.png',
                  color: const Color.fromARGB(100, 3, 0, 0),
                ),
                Text(
                  'Learn Flutter the fun way',
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 145, 145, 243),
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.play_arrow_outlined),
                    onPressed: startquiz,

                    label: const Text(
                      'start quiz',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
