import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Text(
          'Home Screen',
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
            //  color: Theme.of(context).textTheme.headline1?.color,
          ),
        ),
      ),
    );
  }
}
