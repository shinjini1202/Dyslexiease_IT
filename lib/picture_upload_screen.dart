import 'package:flutter/material.dart';

class PictureUploadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF10244C),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/photographer.png', // Path to your photographer image
              height: 150,
            ),
            SizedBox(height: 20),
            Text(
              'Upload your Picture', // Changed text
              style: TextStyle(
                color: Color(0xFF8FF4F9),
                fontSize: 24,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle take a picture
                print('Take a picture tapped');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF8FF4F9),
                foregroundColor: Color(0xFF10244C),
              ),
              child: Text('Take a Picture'), // Changed button text
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Handle upload from gallery
                print('Upload from Gallery tapped'); // Changed button text
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF8FF4F9),
                foregroundColor: Color(0xFF10244C),
              ),
              child: Text('Upload from Gallery'), // Changed button text
            ),
          ],
        ),
      ),
    );
  }
}
