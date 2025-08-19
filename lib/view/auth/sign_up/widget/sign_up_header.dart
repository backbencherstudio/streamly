import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/color.dart';
import '../../../../widgets/custom_text_field.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "New to streamly?",
          style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 16.h,
        ),
        Text(
          "Create an Account",
          style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 28.sp,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 40.h,
        ),
        CustomTextField(hintText: 'Enter your full name'),
        SizedBox(height: 16.h),
        CustomTextField(hintText: 'Enter your email adress'),
        SizedBox(height: 16.h),
        CustomTextField(
          hintText: 'Enter a password',
          suffixIcon: Icon(
            Icons.visibility_off,
            size: 16.sp,
            color: AppColors.textPurple,
          ),
        ),
      ],
    );
  }
}
