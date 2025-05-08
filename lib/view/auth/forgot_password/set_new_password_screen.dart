import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:streamly/widgets/custom_nab_ver.dart';
import 'package:streamly/widgets/primary_button.dart';
import '../../../config/images/images.dart';
import '../../../themes/color.dart';

class SetNewPasswordScreen extends StatelessWidget {
  const SetNewPasswordScreen({super.key});

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40.h),
                  const CustomNabVer(title: ''),
                  SizedBox(height: 35.h),
                  Text(
                    "Set New Password",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "Your new password must be different to previously used passwords.",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 40.h),

                  // Password Field
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: '........',
                      filled: true,
                      fillColor: Colors.transparent,
                      suffixIcon: Icon(Icons.visibility_off,
                          color: AppColors.textPurple),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide:
                            BorderSide(color: AppColors.secondaryBorderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(color: AppColors.borderColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide:
                            BorderSide(color: AppColors.secondaryBorderColor),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 12.h),

                  // Password Conditions
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildCondition(true, '8 characters'),
                            SizedBox(height: 15.h),
                            buildCondition(true, 'Number (0–9)'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildCondition(true, 'Uppercase letter (A–Z)'),
                            SizedBox(height: 15.h),
                            buildCondition(false, 'Lowercase letter (a–z)'),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 24.h),

                  // Confirm Password Field
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: '........',
                      filled: true,
                      fillColor: Colors.transparent,
                      suffixIcon: Icon(Icons.visibility_off,
                          color: AppColors.textPurple),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide:
                            BorderSide(color: AppColors.secondaryBorderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(color: AppColors.borderColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide:
                            BorderSide(color: AppColors.secondaryBorderColor),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 30.h),

                  // Reset Button
                  PrimaryButton(
                    text: 'Reset password',
                    onTap: () {
                      context.go('/resetSuccessScreen');
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

  Widget buildCondition(bool isMet, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          isMet ? Icons.check_circle : Icons.cancel,
          color: isMet ? Colors.green : Colors.red,
          size: 14.sp,
        ),
        SizedBox(width: 3.w),
        Text(
          text,
          style: TextStyle(
              color: isMet ? Colors.green : Colors.red,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
