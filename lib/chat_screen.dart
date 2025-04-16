import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  bool _isLoading = false;

  // 🔹 Replace with your actual Gemini API Key
  String apiKey = dotenv.env['GEMINI_API_KEY'] ?? '';
  String model = "gemini-1.5-pro";
  final String apiUrl = "https://generativelanguage.googleapis.com/v1/models/gemini-pro:generateText";

  Future<void> _sendText(String message) async {
    if (message.isEmpty) return;

    setState(() {
      _messages.insert(0, {"text": message, "isUser": true});
      _isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse("$apiUrl?key=$apiKey"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "prompt": {"text": message},
        }),
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        String reply = responseData["candidates"]?[0]?["content"]?["parts"]?[0]?["text"] ?? "⚠️ No response.";

        setState(() {
          _messages.insert(0, {"text": reply, "isUser": false});
        });
      } else {
        setState(() {
          _messages.insert(0, {"text": "⚠️ Error: Failed to get response.", "isUser": false});
        });
      }
    } catch (e) {
      setState(() {
        _messages.insert(0, {"text": "⚠️ Error: $e", "isUser": false});
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat with Gemini AI"),
        backgroundColor: const Color(0xFF10244C),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Align(
                  alignment: message["isUser"] ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: message["isUser"] ? Colors.blue : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      message["text"],
                      style: TextStyle(color: message["isUser"] ? Colors.white : Colors.black),
                    ),
                  ),
                );
              },
            ),
          ),
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    hintText: "Type a message...",
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  _sendText(_textController.text);
                  _textController.clear();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
