import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Text(
          'Favorite Screen',
          style: TextStyle(
            fontSize: 24,
            //color: Theme.of(context).textTheme.headline1?.color,
          ),
        ),
      ),
    );
  }
}
