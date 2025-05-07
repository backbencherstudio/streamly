import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../config/images/images.dart';
import '../../routes/routes.dart';
import '../../themes/color.dart';
import '../../widgets/outlined_primary_button.dart';
import '../../widgets/primary_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(AppImages.splash, fit: BoxFit.cover),
            ),

            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 420, left: 20, right: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// Rich Text
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Streamly offers seamless streaming of ',
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                          ),
                          TextSpan(
                            text: 'movies, TV shows, ',
                            style: TextStyle(
                              color: AppColors.textPurple,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                          ),
                          TextSpan(
                            text:
                                'and exclusives, tailored for every entertainment lover!',
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 32.h),

                    /// Primary CTA Button
                    PrimaryButton(
                      text: 'Get Started',
                      onTap: () {
                        context.go('/navigationRoot');                      },
                    ),

                    SizedBox(height: 16.h),

                    /// Secondary Button
                    OutlinedPrimaryButton(
                      text: 'Log in',
                      onTap: () {
                        context.go(RoutesName.loginScreen);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
