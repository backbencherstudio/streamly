import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class ScannerCameraScreen extends StatefulWidget {
  const ScannerCameraScreen({super.key});

  @override
  State<ScannerCameraScreen> createState() => _ScannerCameraScreenState();
}

class _ScannerCameraScreenState extends State<ScannerCameraScreen> {
  String extractedText = '';
  File? capturedImage;

  Future<void> captureImageAndExtractText() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.camera);

    if (image == null) {
      Navigator.pop(
          context); // Return to previous screen if no image is captured
      return;
    }

    final inputImage = InputImage.fromFilePath(image.path);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);

    await textRecognizer.close();

    setState(() {
      capturedImage = File(image.path);
      extractedText = recognizedText.text;
    });
  }

  @override
  void initState() {
    super.initState();
    captureImageAndExtractText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan from Camera')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (capturedImage != null) Image.file(capturedImage!, height: 200),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  extractedText.isEmpty ? 'Scanning...' : extractedText,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            if (extractedText.isNotEmpty)
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, extractedText); // Return scanned text
                },
                child: const Text('Use This Text'),
              ),
          ],
        ),
      ),
    );
  }
}
