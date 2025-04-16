import 'package:flutter/material.dart';
import 'text_display_screen.dart'; // Import the new screen

class PasteTextScreen extends StatefulWidget {
  const PasteTextScreen({super.key});

  @override
  State<PasteTextScreen> createState() => _PasteTextScreenState();
}

class _PasteTextScreenState extends State<PasteTextScreen> {
  String pastedText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF10244C),
      appBar: AppBar(
        title: const Text('Paste Text'),
        backgroundColor: const Color(0xFFFFFFFF),
      ),
      body: Center( // Center the content
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center vertically
            children: [
              TextField(
                maxLines: 5,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Paste your text here',
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
                onChanged: (text) {
                  pastedText = text;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (pastedText.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TextDisplayScreen(text: pastedText),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8FF4F9),
                  foregroundColor: const Color(0xFF10244C),
                ),
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}