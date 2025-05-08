import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../themes/color.dart';

class OtpVerificationWidget extends StatelessWidget {
  const OtpVerificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();
    return PinCodeTextField(
      length: 4,
      obscureText: false,
      controller: otpController,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8.r),
        fieldHeight: 48.h,
        fieldWidth: 54.w,
        activeBorderWidth: 1,
        selectedBorderWidth: 1.4,
        activeFillColor: Colors.transparent,
        selectedFillColor: Colors.transparent,
        selectedColor: AppColors.textPurple,
        inactiveFillColor: Colors.transparent,
        inactiveColor: AppColors.textPurple,
        activeColor: AppColors.secondaryBorderColor,
      ),
      textStyle: TextStyle(
        color: Color(0xFFFFFFFF),
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
      ),
      appContext: context,
      animationDuration: Duration(milliseconds: 200),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      onChanged: (value) {},
    );
  }
}
