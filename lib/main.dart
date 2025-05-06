import 'package:flutter/material.dart';
import 'package:streamly/view/home/home.dart';

void main() {
  runApp(const StreamlyApp());
}

class StreamlyApp extends StatelessWidget {
  const StreamlyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Home(),
    );
  }
}