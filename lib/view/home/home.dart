import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:streamly/widgets/outlined_primary_button.dart';
import 'package:streamly/widgets/primary_button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            PrimaryButton(text: "login", onTap: (){}),
            const SizedBox(height: 20),
            OutlinedPrimaryButton(text: "SignUp", onTap: (){}),
            // Add more widgets here as needed
          ],
        ),
      )

    );
  }
}
