import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/themes/color.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? suffixIconWithText;
  final int maxLines;
  final bool? isObSecure;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Color? fileColor;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixIconWithText,
    this.maxLines = 1,
    this.isObSecure,
    this.controller,
    this.validator,
    this.fileColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: TextFormField(
        maxLines: maxLines,
        controller: controller,
        validator: validator,
        obscureText: isObSecure ?? false,
        style: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 14.sp,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.lightGrey,
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
          ),
          filled: true,
          fillColor: fileColor ?? AppColors.background,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIconWithText ?? suffixIcon,
          suffixIconColor: AppColors.lightGrey,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.secondaryBorderColor),
            borderRadius: BorderRadius.circular(10.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textPurple),
            borderRadius: BorderRadius.circular(10.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.secondaryBorderColor),
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ),
    );
  }
}
