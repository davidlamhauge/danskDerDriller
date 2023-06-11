import 'package:dansk_app/subject_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Forside'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Vælg emne:',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            Column(
              children: const [
                SubjectButton(subject: 'nutidsr', txt: 'Nutids-R ?'),
                SubjectButton(subject: 'dobbeltk', txt: 'Dobbeltkonsonant ?'),
                SubjectButton(subject: 'stumme', txt: 'Stumme bogstaver ?'),
                SubjectButton(subject: 'ligge', txt: 'Ligge eller lægge ?'),
                SubjectButton(subject: 'eneende', txt: '-ene eller -ende ?'),
                SubjectButton(subject: 'adaf', txt: 'Ad eller af ?'),
                SubjectButton(subject: 'nogen', txt: 'Nogen eller nogle ?'),
              ],
            ),
            Image.asset(
              'assets/danskDerDriller.png',
              fit: BoxFit.fitWidth,
              alignment: Alignment.bottomCenter,
            ),
          ],
        ),
      ),
    );
  }
}
