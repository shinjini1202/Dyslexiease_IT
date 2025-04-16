import 'package:dyslexiease/firebase_options.dart';
import 'package:flutter/material.dart';
import 'pdf_upload_screen.dart';
import 'picture_upload_screen.dart';
import 'paste_text_screen.dart';
import 'text_display_screen.dart';
import 'chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(), // Changed: Always start with SplashScreen and added const
      routes: {
        '/home': (context) => HomePage(),
        '/pdf_upload': (context) => PDFUploadScreen(),
        '/picture_upload': (context) => PictureUploadScreen(),
        '/paste_text': (context) => const PasteTextScreen(),
        '/text_display': (context) => const TextDisplayScreen(text: ''),
        '/chat': (context) => ChatScreen(),
        '/auth': (context) => const AuthScreen(),
      },
      theme: ThemeData(
        fontFamily: 'OpenDyslexic',
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key}); // Added const key
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  _navigateToNextScreen() async { // Changed: New function
    await Future.delayed(const Duration(seconds: 4));

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        Navigator.pushReplacementNamed(context, '/home'); // Go to home if logged in
      } else {
        Navigator.pushReplacementNamed(context, '/auth'); // Go to auth if not logged in
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF10244C),
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset(
              'assets/icon.png',
              height: 500,
            ),
          ),
          const Positioned( // Added const
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
  const HomePage({super.key}); // Added const key
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF10244C),
      appBar: AppBar( // Added AppBar for logout button
        title: const Text('Dyslexiease'),
        backgroundColor: const Color(0xFF10244C),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/auth');
            },
          ),
        ],
      ),
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
                  const SizedBox(height: 20),
                  const Text(
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
                      _buildIconButton('assets/pdf.png', 'Scan PDF', context),
                      _buildIconButton('assets/camera.png', 'Scan Picture', context),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _buildIconButton('assets/note.png', 'Paste Text', context),
                      _buildIconButton('assets/bot.png', 'Chat', context),
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

  Widget _buildIconButton(String imagePath, String text, BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            if (text == 'Scan PDF') {
              Navigator.pushNamed(context, '/pdf_upload');
            } else if (text == 'Scan Picture') {
              Navigator.pushNamed(context, '/picture_upload');
            } else if (text == 'Paste Text') {
              Navigator.pushNamed(context, '/paste_text');
            } else if (text == 'Chat') {
              Navigator.pushNamed(context, '/chat'); // ✅ Navigate to Chat Screen
            } else {
              print('Button tapped: $text');
            }
          },
          child: Image.asset(
            imagePath,
            height: 80,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          text,
          style: const TextStyle(
            color: Color(0xFF8FF4F9),
          ),
        ),
      ],
    );
  }
}