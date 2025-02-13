import 'package:dyslexiease/firebase_options.dart';
import 'package:flutter/material.dart';
import 'pdf_upload_screen.dart'; // Import your PDF upload screen
import 'picture_upload_screen.dart';
import 'paste_text_screen.dart'; // Import the paste text screen
import 'text_display_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp()); // Added const and parentheses
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      routes: {
        '/home': (context) => HomePage(),
        '/pdf_upload': (context) => PDFUploadScreen(),
        '/picture_upload': (context) => PictureUploadScreen(),
        '/paste_text': (context) => const PasteTextScreen(),// Add the route for PDF upload
        '/text_display': (context) => const TextDisplayScreen(text: ''),
      },
      theme: ThemeData(
        fontFamily: 'OpenDyslexic',
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 4));
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF10244C),
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset(
              'assets/icon.png',
              height: 500,
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Text(
              'Made with ❤️ in India by LunaBytes',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF10244C),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/teacher.png',
                    height: 150,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Hey there Champ, how can I help you?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF8FF4F9),
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _buildIconButton('assets/pdf.png', 'Scan PDF', context), // Pass context
                      _buildIconButton('assets/camera.png', 'Scan Picture', context), // Pass context
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _buildIconButton('assets/note.png', 'Paste Text', context), // Pass context
                      _buildIconButton('assets/bot.png', 'Chat', context), // Pass context
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(String imagePath, String text, BuildContext context) { // Add BuildContext parameter
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            if (text == 'Scan PDF') {
              Navigator.pushNamed(context, '/pdf_upload'); // Navigate to PDF upload screen
            } else if (text == 'Scan Picture') {
              Navigator.pushNamed(context, '/picture_upload'); // Navigate to Picture Screen
            } else if (text == 'Paste Text') { // Add this condition
              Navigator.pushNamed(context, '/paste_text'); // Navigate to paste text screen
            } else {
              print('Button tapped: $text');
            }
          },
          child: Image.asset(
            imagePath,
            height: 80,
          ),
        ),
        SizedBox(height: 8),
        Text(
          text,
          style: TextStyle(
            color: Color(0xFF8FF4F9),
          ),
        ),
      ],
    );
  }
}

