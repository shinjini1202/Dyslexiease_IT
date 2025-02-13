import 'package:flutter/material.dart';

class PDFUploadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF10244C),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/programmer.png', // Path to your programmer image
              height: 150,
            ),
            SizedBox(height: 20),
            Text(
              'Upload your PDF',
              style: TextStyle(
                color: Color(0xFF8FF4F9),
                fontSize: 24,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle upload from device
                print('Upload from Device tapped');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF8FF4F9), // Light pink background
                foregroundColor: Color(0xFF10244C), // Dark blue text
              ),
              child: Text('Upload from Device'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Handle import from Google Drive
                print('Import from Google Drive tapped');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF8FF4F9), // Light pink background
                foregroundColor: Color(0xFF10244C), // Dark blue text
              ),
              child: Text('Import from Google Drive'),
            ),
          ],
        ),
      ),
    );
  }
}