import 'package:flutter/material.dart';
import 'package:dansk_app/practice_screen.dart';

import 'package:dansk_app/data/nutidsr.dart';

class PreparePractice extends StatefulWidget {
  const PreparePractice({Key? key, required this.subject}) : super(key: key);
  final String subject;

  @override
  State<PreparePractice> createState() => _PreparePracticeState();
}

class _PreparePracticeState extends State<PreparePractice> {
  String _getSubject() {
    String txt = '';
    switch (widget.subject) {
      case 'nutidsr':
        txt = 'Nutids-r ?';
        break;
      case 'dobbeltk':
        txt = 'Dobbeltkonsonant ?';
        break;
      case 'stumme':
        txt = 'Stumme bogstaver ?';
        break;
      case 'etellerto':
        txt = 'Et eller to ord ?';
        break;
      case 'ligge':
        txt = 'Ligge eller Lægge ?';
        break;
      case 'eneende':
        txt = '-ene eller -ende ?';
        break;
      case 'adaf':
        txt = 'Ad eller Af ?';
        break;
      default:
        txt = 'Nutids-r ?';
        break;
    }
    return txt;
  }

  late List<String> liste;

  List<String> _getList() {
    switch (widget.subject) {
      case 'nutidsr':
        liste = nutidsrArray;
        break;
      default:
        liste = nutidsrArray;
        break;
    }
    return liste;
  }

  @override
  Widget build(BuildContext context) {
    List<String> opgaver = _getList();
    return Scaffold(
      appBar: AppBar(
        title: Text(_getSubject()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubjectScreen(
                                subject: _getSubject(),
                                questions: _getList(),
                                numQuestions: 10),
                          ));
                    },
                    child: const Text('10 opgaver')),
                OutlinedButton(
                    onPressed: () {}, child: const Text('20 opgaver')),
                OutlinedButton(
                    onPressed: () {}, child: Text('${opgaver.length ~/ 2} opgaver')),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Fortryd'),
                ),
              ],
            ),
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
