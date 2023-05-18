import 'package:dansk_app/prepare_practice.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
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
            const SizedBox(height: 50),
            const Text(
              'Vælg emne:',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            Column(
              children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  minimumSize: const Size(300, 36),
                ),
                onPressed: () {},
                child: const Text('Nutids-R ?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    minimumSize: const Size(300, 36),
                  ),
                  onPressed: () {},
                  child: const Text('Dobbeltkonsonant ?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    minimumSize: const Size(300, 36),
                  ),
                  onPressed: () {},
                  child: const Text('Stumme bogstaver ?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    minimumSize: const Size(300, 36),
                  ),
                  onPressed: () {},
                  child: const Text('Et eller to ord ?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    minimumSize: const Size(300, 36),
                  ),
                  onPressed: () {},
                  child: const Text('Ligge eller lægge ?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    minimumSize: const Size(300, 36),
                  ),
                  onPressed: () {},
                  child: const Text('-ene eller -ende ?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    minimumSize: const Size(300, 36),
                  ),
                  onPressed: () {},
                  child: const Text('Ad eller af ?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              /*
                SubjectButton(text: 'Med eller uden R ?', subject: 'medellerudenr',),
                SubjectButton(text: 'Dobbeltkonsonant ?', subject: 'dobbeltkonsonant',),
                SubjectButton(text: 'Stumme bogstaver ?', subject: 'stummebogstaver',),
                SubjectButton(text: 'Et eller to ord ?', subject: 'etellertoord',),
                SubjectButton(text: 'Ligge eller lægge ?', subject: 'ligge',),
                SubjectButton(text: '-ene eller -ende ?', subject: 'eneende',),
                SubjectButton(text: 'Ad eller af ?', subject: 'adelleraf',), */
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

Type getSubject() {



  return Widget;
}