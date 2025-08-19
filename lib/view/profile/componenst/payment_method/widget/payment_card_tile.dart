import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/themes/color.dart';

class PaymentTile extends StatelessWidget {
  final String title;
  final String icon;
  final String value;
  final String groupValue;
  final ValueChanged<String?> onChanged;

  const PaymentTile({
    super.key,
    required this.title,
    required this.icon,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xff1C082B),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          width: 1.8,
          color: groupValue == value
              ? AppColors.borderColor
              : const Color(0xff4A4C56),
        ),
      ),
      child: Row(
        children: [
          Image.asset(icon, width: 24.w, height: 24.h),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
              ),
            ),
          ),
          Radio<String>(
            activeColor: AppColors.textPurple,
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
