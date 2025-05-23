import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamly/themes/color.dart';

class OutlinedPrimaryButton extends StatelessWidget {
  final double? width;
  final String text;
  final VoidCallback onTap;

  const OutlinedPrimaryButton({
    super.key,
    this.width,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 1.sw,
        height: 50.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: AppColors.buttonBorder, // Light purple border
            width: 1.5.w,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: AppColors.textPurple,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
