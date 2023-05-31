import 'dart:math';

import 'package:flutter/material.dart';

class SubjectScreen extends StatefulWidget {
  const SubjectScreen(
      {super.key,
      required this.subject,
      required this.questions,
      required this.numQuestions});

  final String subject;
  final List<String> questions;
  final int numQuestions;

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {

  int yes = 0;
  int no = 0;
  int questNum = 0; // number of strings read. 2 per quiz
  int quizNum = 0;  // number of quizzes taken

  bool _justAnswered = false;
  bool _set1Green = false;
  bool _set2Green = false;

  Color? quizButtonColor = Colors.lightBlue[100];

  String option1 = '';
  String option2 = '';
  String correctAnswer = '';
  String nextButtonText = 'Næste...';

  List<String> strings = [];  // array with the desired number of quizzes
  List<String> pairs = [];    //


  List<String> _getArray(int q) {
    strings.clear();
    for (int i = q; i < q + 2; i++) {
      strings.add(widget.questions[i]);
    }
    return strings;
  }

  void _getQuizStrings(int num) {
    setState(() {
      _set1Green = false;
      _set2Green = false;
      pairs = _getArray(questNum);
      correctAnswer = pairs[0];
      pairs.shuffle();
      option1 = pairs[0];
      option2 = pairs[1];
      questNum += 2;
      quizNum++;
    });
  }

  void _updateScore(String txt, int option) {
    setState(() {
      if (txt == correctAnswer) {
        yes++;
        if (option == 1) { _set1Green = true; }
        else { _set2Green = true; }
      }
      else
      {
        no++;
        if (option == 1) { _set2Green = true; }
        else { _set1Green = true; }
      }
    });
  }

  @override

  void initState() {
    _getQuizStrings(questNum);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subject),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.thumb_up, size: 50, color: Colors.green),
                Icon(Icons.thumb_down, size: 50, color: Colors.red),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  yes.toString(),
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  no.toString(),
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            /*
                    child: ElevatedButton(
          onPressed: () => setState(() => _flag = !_flag),
          child: Text(_flag ? 'Red' : 'Green'),
          style: ElevatedButton.styleFrom(
            backgroundColor: _flag ? Colors.red : Colors.teal, // This is what you need!

             */
            Column(
              children: [
                TextButton(
                  onPressed: () {
                    _updateScore(option1, 1);
                  },
                  style: TextButton.styleFrom(
                    minimumSize: const Size.fromHeight(30),
                    backgroundColor: _set1Green ? Colors.green : quizButtonColor,
                    foregroundColor: Colors.black,
                  ),
                  child: Text(option1,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    _updateScore(option2, 2);
                  },
                  style: TextButton.styleFrom(
                    minimumSize: const Size.fromHeight(30),
                    backgroundColor: _set2Green ? Colors.green : quizButtonColor,
                    foregroundColor: Colors.black,
                  ),
                  child:  Text(option2,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                    onPressed: () {
                      _getQuizStrings(questNum);
                    },
                    icon: const Icon(
                      Icons.keyboard_double_arrow_right,
                    ),
                    label: const Text(
                        'Næste...',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                Image.asset(
                  'assets/danskDerDriller.png',
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.bottomCenter,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
