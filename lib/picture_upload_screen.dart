import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'handwritten_note_channel.dart'; // Import the channel
import 'text_display_screen.dart'; // Import TextDisplayScreen

class PictureUploadScreen extends StatefulWidget {
  @override
  _PictureUploadScreenState createState() => _PictureUploadScreenState();
}

class _PictureUploadScreenState extends State<PictureUploadScreen> {
  final ImagePicker _picker = ImagePicker();
  String _extractedText = "";

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      final text = await processImage(pickedFile.path); // Use the channel
      setState(() {
        _extractedText = text;
      });
      if (_extractedText.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TextDisplayScreen(text: _extractedText),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF10244C),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/photographer.png',
              height: 150,
            ),
            const SizedBox(height: 20),
            const Text(
              'Upload your Picture',
              style: TextStyle(
                color: Color(0xFF8FF4F9),
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _pickImage(ImageSource.camera), // Use _pickImage
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8FF4F9),
                foregroundColor: const Color(0xFF10244C),
              ),
              child: const Text('Take a Picture'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _pickImage(ImageSource.gallery), // Use _pickImage
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8FF4F9),
                foregroundColor: const Color(0xFF10244C),
              ),
              child: const Text('Upload from Gallery'),
            ),
          ],
        ),
      ),
    );
  }
}