import 'package:flutter/material.dart';

class SubjectScreen extends StatefulWidget {
  const SubjectScreen({super.key, required this.subject});

  final String subject;



  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  int numQuestions = 0;


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
