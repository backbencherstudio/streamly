import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LiveScreen extends StatelessWidget {
  const LiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Text(
          'Live Screen',
          style: TextStyle(
            fontSize: 24,
          //  color: Theme.of(context).textTheme.headline1?.color,
          ),
        ),
      ),
    );
  }
}
