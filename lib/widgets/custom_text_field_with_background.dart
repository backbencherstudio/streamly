import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamly/config/icons/icons.dart';

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
          color: const Color(0xff1C082B),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            /// Prefix Icon
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 20.w,
                height: 20.h,
                child: Transform.scale(
                  scale: 0.7,
                  child: Image.asset(iconPath),
                ),
              ),
            ),

            /// Hint Text
            Expanded(
              child: Text(
                hintText,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 14.sp,
                ),
              ),
            ),

            /// Suffix Icon or Arrow
            if (suffix != null)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: suffix,
              )
            else
              Padding(
                padding: const EdgeInsets.all(12.0),
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
