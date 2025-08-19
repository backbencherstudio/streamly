import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:streamly/widgets/primary_button.dart';

import '../../../core/constants/icons/icons.dart';
import '../../../core/constants/images/images.dart';
import '../../../core/routes/routes.dart';
import '../../../core/themes/color.dart';

class ResetSuccessScreen extends StatelessWidget {
  const ResetSuccessScreen({super.key});

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
                  SizedBox(height: 100.h),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(90.r),
                    child: Container(
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Image.asset(AppIcons.success, fit: BoxFit.fill),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    "Password reset done!",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "Your password has been successfully reset. Click below to log in.",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 60.h),
                  PrimaryButton(
                    text: 'Continue',
                    onTap: () {
                      context.go(RoutesName.loginScreen);
                      // Navigate or handle reset
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
