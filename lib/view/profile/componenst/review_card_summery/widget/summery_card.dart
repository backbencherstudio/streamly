import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamly/themes/color.dart';
import '../../../../../config/icons/icons.dart';
import 'check_item.dart';

class SummeryCard extends StatelessWidget {
  const SummeryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.textPurple,
                  blurRadius: 44,
                  offset: Offset(0, 30),
                ),
              ],
            ),
            child: Image.asset(
              AppIcons.subscription,
              height: 40,
            ),
          ),
          SizedBox(height: 12.h),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "\$20.64",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                TextSpan(
                  text: "/month",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white60,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Divider(color: Color(0xff1D082E)),
          SizedBox(height: 12.h),
          buildCheckItem("Ad-free listening without restrictions"),
          buildCheckItem("Unlimited shuffle play and downloads"),
          buildCheckItem("Premium audio quality"),
        ],
      ),
    );
  }
}
