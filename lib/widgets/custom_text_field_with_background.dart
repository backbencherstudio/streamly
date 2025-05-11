import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamly/config/icons/icons.dart';
import '../themes/color.dart';

Widget customContainerWithBackground({
  required String hintText,
  required String iconPath,
  Widget? suffix,
  required VoidCallback onTap,
}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 16.h),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: AppColors.primaryDark,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(8.w),
              child: SizedBox(
                width: 20.w,
                height: 20.h,
                child: Transform.scale(
                  scale: 0.9,
                  child: Image.asset(iconPath),
                ),
              ),
            ),
            Expanded(
              child: Text(
                hintText,
                style: TextStyle(
                  color: AppColors.lightGrey,
                  fontSize: 14.sp,
                ),
              ),
            ),
            if (suffix != null)
              Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: suffix,
              )
            else
              Padding(
                padding: EdgeInsets.all(12.w),
                child: SizedBox(
                  width: 24.w,
                  height: 24.h,
                  child: Image.asset(AppIcons.rightArrow),
                ),
              ),
          ],
        ),
      ),
    ),
  );
}
