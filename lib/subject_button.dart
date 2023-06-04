import 'package:flutter/material.dart';
import 'package:dansk_app/prepare_practice.dart';

class SubjectButton extends StatelessWidget {
  const SubjectButton({Key? key, required this.subject, required this.txt})
      : super(key: key);

  final String subject;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        minimumSize: const Size(300, 32),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PreparePractice(subject: subject)),
        );
      },
      child: Text(
        txt,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
