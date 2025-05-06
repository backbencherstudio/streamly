import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamly/widgets/custom_text_field.dart';
import 'package:streamly/config/icons/icons.dart';

Widget customTextFieldWithBackground({
  required String hintText,
  required String iconPath,
  Widget? suffix,
}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 16.h),
    child: CustomTextField(
      fileColor: const Color(0xff1C082B),
      hintText: hintText,
      prefixIcon: Padding(
        padding: EdgeInsets.all(8.0),
        child: SizedBox(
          width: 20.w,
          height: 20.h,
          child: Transform.scale(scale: 0.7, child: Image.asset(iconPath)),
        ),
      ),
      suffixIconWithText: suffix != null
          ? Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: suffix,
      )
          : null,
      suffixIcon: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          width: 35.w,
          height: 24.h,
          child: Image.asset(AppIcons.rightArrow),
        ),
      ),
    ),
  );
}
