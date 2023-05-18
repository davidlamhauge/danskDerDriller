import 'package:flutter/material.dart';

class PreparePractice extends StatefulWidget {
  const PreparePractice({super.key, required this.subject});

  final String subject;

  @override
  State<PreparePractice> createState() => _PreparePracticeState();
}

class _PreparePracticeState extends State<PreparePractice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subject),
      ),
    );
  }
}
