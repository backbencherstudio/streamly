import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/custom_text_field.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox.expand(
        child: Stack(
          children: [
            SvgPicture.asset(
              'assets/images/background.svg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),

            Positioned.fill(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [CustomTextField(hintText: 'Login')],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
