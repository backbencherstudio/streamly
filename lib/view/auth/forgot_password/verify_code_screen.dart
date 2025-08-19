import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:streamly/view/auth/forgot_password/widget/otp_verification_widget.dart';
import 'package:streamly/widgets/custom_nab_ver.dart';
import 'package:streamly/widgets/primary_button.dart';
import '../../../core/constants/images/images.dart';
import '../../../core/themes/color.dart';


class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

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
                children: [
                  SizedBox(height: 40.h), // Adjust as needed

                  CustomNabVer(),
                  SizedBox(
                    height: 35.h,
                  ),
                  Text(
                    "Check Your Email",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "We sent a verification link to olivia@untitledui.com",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  OtpVerificationWidget(), SizedBox(height: 16.h),
                  PrimaryButton(
                    text: 'Verify email',
                    onTap: () {
                      context.go('/setNewPasswordScreen');
                    },
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
