import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int maxLines;
  final bool? isObSecure;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLines = 1,
    this.isObSecure,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: TextFormField(
        maxLines: 1,
        controller: controller,
        validator: validator,
        obscureText: isObSecure ?? false,

        style: TextStyle(color: Colors.white, fontSize: 14.sp),

        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: const Color(0xff9A9EA7),
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
          ),
          filled: true,
          fillColor: const Color(0xff060209),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          suffixIconColor: const Color(0xff9A9EA7),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h,
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff4A4C56)),
            borderRadius: BorderRadius.circular(10.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffAD59F3)),
            borderRadius: BorderRadius.circular(10.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff4A4C56)),
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ),
    );
  }
}
