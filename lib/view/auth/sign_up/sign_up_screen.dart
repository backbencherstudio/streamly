import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:streamly/view/auth/sign_up/widget/sign_up_form.dart';
import 'package:streamly/view/auth/sign_up/widget/social_signUp_option.dart';
import '../../../core/constants/images/images.dart';
import '../../../core/routes/routes.dart';
import '../../../core/themes/color.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                    "New to streamly?",
                    style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 16.h,),
                  Text(
                    "Create an Account",
                    style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 40.h,),
                  const SignUpForm(),
                  SizedBox(height: 16.h),
                  Align(
                    alignment: Alignment.center,
                    child: Text.rich(
                      TextSpan(
                        text: 'Already have an account? ',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                        children: [
                          TextSpan(
                            text: 'Log in',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: AppColors.textPurple,
                              fontSize: 14.sp,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.push(RoutesName.loginScreen);
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),
                  const SocialSignupOption(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
