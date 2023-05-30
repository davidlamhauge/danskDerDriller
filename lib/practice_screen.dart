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
  int questNum = 0;

  bool _justAnswered = false;

  String option1 = '';
  String option2 = '';
  String correctAnswer = '';

  List<String> strings = [];
  List<String> pairs = [];


  List<String> _getArray(int q) {
    strings.clear();
    for (int i = q; i < q + 2; i++) {
      strings.add(widget.questions[i]);
    }
    return strings;
  }

  void _getStrings(int num) {
    setState(() {
      pairs = _getArray(questNum);
      correctAnswer = pairs[0];
      pairs.shuffle();
      option1 = pairs[0];
      option2 = pairs[1];
      questNum += 2;
    });
  }

  void _updateScore(String txt) {
    setState(() {
      if (txt == correctAnswer) {
        yes++;
      }
      else {
        no++;
      }
      _getStrings(questNum);
    });
  }

  @override

  void initState() {
    _getStrings(questNum);
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
            Column(
              children: [
                TextButton(
                  onPressed: () {
                    _updateScore(option1);
                  },
                  style: TextButton.styleFrom(
                    minimumSize: const Size.fromHeight(30),
                    backgroundColor: Colors.lightBlueAccent[100],
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
                    _updateScore(option2);
                  },
                  style: TextButton.styleFrom(
                    minimumSize: const Size.fromHeight(30),
                    backgroundColor: Colors.lightBlueAccent[100],
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
                OutlinedButton(
                    onPressed: () {},
                    child: const Text(
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
