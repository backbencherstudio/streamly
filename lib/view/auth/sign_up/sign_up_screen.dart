import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:streamly/view/auth/sign_up/widget/sign_up_header.dart';
import 'package:streamly/view/auth/sign_up/widget/social_signUp_option.dart';
import 'package:streamly/widgets/primary_button.dart';
import '../../../config/images/images.dart';
import '../../../routes/routes.dart';
import '../../../themes/color.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(AppImages.background, fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SignUpHeader(),
                  const SizedBox(height: 32),
                  PrimaryButton(
                      text: 'Create account',
                      onTap: () {
                        context.go('/navigationRoot');
                      }),
                  SizedBox(height: 16.h),
                  Text.rich(
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
