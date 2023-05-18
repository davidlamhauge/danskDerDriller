import 'package:flutter/material.dart';
import 'package:dansk_app/prepare_practice.dart';

class SubjectButton extends StatelessWidget {
  const SubjectButton({super.key, required this.text, required this.subject, required this.onTap});

  final String text;
  final String subject;
  final void Function() onTap;

  @override
  Widget build(context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        minimumSize: const Size(300, 36),
      ),
      onPressed: onTap,
      child: Text(text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }

}