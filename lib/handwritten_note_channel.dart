import 'package:flutter/services.dart';

const MethodChannel handwrittenNoteChannel = MethodChannel('handwritten_note');

Future<String> processImage(String imagePath) async {
  try {
    final String result = await handwrittenNoteChannel.invokeMethod('processImage', {'imagePath': imagePath});
    return result;
  } on PlatformException catch (e) {
    print("Failed to process image: '${e.message}'.");
    return "";
  }
}