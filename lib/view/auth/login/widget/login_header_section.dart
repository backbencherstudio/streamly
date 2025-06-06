import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../themes/color.dart';
import '../../../../widgets/custom_text_field.dart';

class LoginHeaderSection extends StatelessWidget {
  const LoginHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        CustomTextField(hintText: 'example@gmail.com'),
        SizedBox(height: 16.h),
        CustomTextField(
          hintText: 'Password',
          suffixIcon: Icon(
            Icons.visibility_off,
            size: 16.sp,
            color: AppColors.textPurple,
          ),
        ),
        SizedBox(height: 16.h),
        Transform.translate(
          offset: Offset(-8.w, 0),
          child: Row(
            children: [
              Checkbox(value: true, onChanged: (value) {}),
              Transform.translate(
                offset: Offset(-8.w, 0),
                child: Text(
                  "Remember me",
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  context.go('/forgotPasswordScreen');
                },
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w300,
                        fontSize: 14.sp,
                      ),
                    ),
                    Positioned(
                      bottom: -2,
                      child: Container(
                        width: 137,
                        height: 3,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
