import 'package:flutter/material.dart';
import '../../config/images/images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            // Background Image
            Image.asset(
              AppImages.splash,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),

            // Centered Text Overlay
            Center(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 24.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      height: 1.5,
                    ),
                    children: const [
                      TextSpan(

                          text: 'Streamly offers seamless streaming of ',

                      ),
                      TextSpan(
                        text: 'movies, TV shows, ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text:
                        'and exclusives, tailored for every entertainment lover!',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
