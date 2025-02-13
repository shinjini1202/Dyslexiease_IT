import 'package:flutter/material.dart';

class TextDisplayScreen extends StatelessWidget {
  final String text;

  const TextDisplayScreen({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF10244C),
      appBar: AppBar(
        title: const Text('Displayed Text'),
        backgroundColor: const Color(0xFF10244C),
      ),
      body: SingleChildScrollView( // For scrolling
        padding: const EdgeInsets.all(16.0),
        child: Center( // Center the text
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 24, // Increased font size
              color: Color(0xFF8FF4F9),
            ),
          ),
        ),
      ),
    );
  }
}