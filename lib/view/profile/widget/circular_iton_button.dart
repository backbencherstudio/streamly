
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/color.dart';

Widget circularIconButton(String iconPath, {VoidCallback? onTap}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(100),
    child: Container(
      padding: EdgeInsets.all(8.r),
      decoration: const BoxDecoration(
        color: Color(0xff1E092E),
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        iconPath,
        color: AppColors.textPrimary,
        width: 24.w,
        height: 24.h,
      ),
    ),
  );
}