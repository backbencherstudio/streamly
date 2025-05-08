import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/icons/icons.dart';
import '../../../../themes/color.dart';

class SocialSignupOption extends StatelessWidget {
  const SocialSignupOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 32.h),
        Row(
          children: [
            const Expanded(child: Divider(color: Colors.white)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "Or Register with",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            const Expanded(child: Divider(color: Colors.white)),
          ],
        ),
        SizedBox(height: 32.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _socialLogin(AppIcons.google),
            SizedBox(width: 16.w),
            _socialLogin(AppIcons.apple),
            SizedBox(width: 16.w),
            _socialLogin(AppIcons.facebook),
          ],
        ),
      ],
    );
  }

  Widget _socialLogin(String iconPath) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: AppColors.containerBackground,
        border: Border.all(color: Colors.white),
        shape: BoxShape.circle,
      ),
      child: Image.asset(iconPath, width: 24.w, height: 24.h),
    );
  }
}
