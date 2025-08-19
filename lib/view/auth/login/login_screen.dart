import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:streamly/view/auth/login/widget/login_form_widget.dart';
import 'package:streamly/view/auth/login/widget/social_login_option.dart';

import '../../../core/constants/images/images.dart';
import '../../../core/themes/color.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AppImages.background, fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hey! Welcome",
                    style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    "Login to \nYour Account",
                    style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  const LoginFormWidget(),
                  SizedBox(height: 16.h),
                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        text: 'New to Streamly? ',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.white),
                        children: [
                          TextSpan(
                            text: 'Create an Account',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: AppColors.textPurple,
                              fontSize: 14.sp,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.go( '/signUpScreen');
                              },
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 32.h),
                  // signUpScreen
                  const SocialLoginOptions(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
