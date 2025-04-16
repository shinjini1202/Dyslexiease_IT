import 'package:flutter/material.dart';

class TextDisplayScreen extends StatefulWidget {
  final String text;

  const TextDisplayScreen({super.key, required this.text});

  @override
  State<TextDisplayScreen> createState() => _TextDisplayScreenState();
}

class _TextDisplayScreenState extends State<TextDisplayScreen> {
  double fontSize = 24;
  double letterSpacing = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF10244C),
      appBar: AppBar(
        title: const Text('Displayed Text'),
        backgroundColor: const Color(0xFFFFFFFF),
        actions: [
          IconButton(
            icon: const Icon(Icons.text_fields),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Adjust Text Settings'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Slider(
                          value: fontSize,
                          min: 16,
                          max: 32,
                          onChanged: (value) {
                            setState(() {
                              fontSize = value;
                            });
                          },
                          label: 'Font Size',
                        ),
                        Slider(
                          value: letterSpacing,
                          min: -2,
                          max: 5,
                          onChanged: (value) {
                            setState(() {
                              letterSpacing = value;
                            });
                          },
                          label: 'Character Spacing',
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container( // Added Container for styling
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: fontSize,
                color: const Color(0xFF10244C), // Text color inside container
                letterSpacing: letterSpacing, // Apply letter spacing
              ),
            ),
          ),
        ),
      ),
    );
  }
}