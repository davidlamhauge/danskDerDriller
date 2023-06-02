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
  int questNum = 0; // number of strings read.
  int quizNum = 0; // number of quizzes taken

  bool _justAnswered = false;
  bool _showNextButton = true;
  bool _set1Green = false;
  bool _set2Green = false;

  Color? quizButtonColor = Colors.lightBlue[100];

  String option1 = '';
  String option2 = '';
  String correctAnswer = '';
  String nextButtonText = 'Næste...';

  List<String> strings = []; // array with the desired number of quizzes
  List<String> pairs = []; //
  List<List<String>> quizArray = [];

  List<List<String>> _getFinalArray(int num) {
    strings.clear();
    for (int i = 0; i < widget.questions.length ~/ 2; i++) {
      for (int j = 0; j < 2; j++) {
        if (j == 0) {
          option1 = widget.questions[j + i * 2];
        } else if (j == 1) {
          option2 = widget.questions[j + i * 2];
          quizArray.add([option1, option2]);
        }
      }
    }
    quizArray.shuffle();
    print('Quiz array');
    print(quizArray);
    return quizArray;
  }

  List<String> _getSelectedArray(int num) {
    print('array size: ${quizArray.length}');
    pairs.clear();
    pairs = quizArray[num];
    return pairs;
  }

  void _getQuizStrings(int num) {
    setState(() {
      if (quizNum >= widget.numQuestions) {
        _noMoreQuizzes();
      } else {
        _set1Green = false;
        _set2Green = false;
        pairs = _getSelectedArray(quizNum);
        print(pairs[0]);
        print(pairs[1]);
        correctAnswer = pairs[0];
        pairs.shuffle();
        option1 = pairs[0];
        option2 = pairs[1];
        quizNum++;
        print('quiznum: $quizNum');
        _justAnswered = false;
      }
    });
  }

  void _updateScore(String txt, int option) {
    setState(() {
      if (txt == correctAnswer) {
        yes++;
        if (option == 1) {
          _set1Green = true;
        } else {
          _set2Green = true;
        }
      } else {
        no++;
        if (option == 1) {
          _set2Green = true;
        } else {
          _set1Green = true;
        }
      }
      if (quizNum == widget.numQuestions) {
        _showNextButton = false;
      }
      _justAnswered = true;
    });
  }

  void _noMoreQuizzes() {
    setState(() {
      nextButtonText = 'AFSLUT (pil øverst)';
      _showNextButton = false;
      _justAnswered = false;
    });
  }

  @override
  void initState() {
    quizArray = _getFinalArray(widget.numQuestions);
    _getQuizStrings(quizNum);
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
                    _justAnswered ? null : _updateScore(option1, 1);
                  },
                  style: TextButton.styleFrom(
                    minimumSize: const Size.fromHeight(30),
                    backgroundColor:
                        _set1Green ? Colors.green : quizButtonColor,
                    foregroundColor: Colors.black,
                  ),
                  child: Text(
                    option1,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    _justAnswered ? null : _updateScore(option2, 2);
                  },
                  style: TextButton.styleFrom(
                    minimumSize: const Size.fromHeight(30),
                    backgroundColor:
                        _set2Green ? Colors.green : quizButtonColor,
                    foregroundColor: Colors.black,
                  ),
                  child: Text(
                    option2,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                !_showNextButton
                    ? Text(
                        'Resultat: $yes ud af ${widget.numQuestions}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      )
                    : ElevatedButton.icon(
                        onPressed: () {
                          _justAnswered ? _getQuizStrings(quizNum) : null;
                        },
                        icon: const Icon(
                          Icons.keyboard_double_arrow_right,
                        ),
                        label: Text(
                          nextButtonText,
                          style: const TextStyle(
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
