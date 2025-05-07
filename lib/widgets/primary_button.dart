import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamly/themes/color.dart';

class PrimaryButton extends StatelessWidget {
  final double? width;
  final String text;
  final VoidCallback onTap;
  final Color? color;

  const PrimaryButton({
    super.key,
    this.width,
    required this.text,
    required this.onTap,
    this.color,
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
          color: color ?? AppColors.buttonBackground, // Purple color
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
