import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/icons/icons.dart';
import '../../../../../core/themes/color.dart';

class MostPopularPlan extends StatelessWidget {
  final String title;
  final String price;
  const MostPopularPlan({
    super.key,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final features = [
      "Ad-free streaming",
      "Allows 8 streaming",
      "HD quality",
    ];
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.transparent,
        border: Border.all(color: AppColors.textPurple),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: Color(0xff7A24BC),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Image.asset(AppIcons.subscription, height: 50.h),
          SizedBox(height: 12.h),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "\$$price ",
                  style: TextStyle(
                    color: AppColors.textPurple,
                    fontWeight: FontWeight.w700,
                    fontSize: 32.sp,
                  ),
                ),
                TextSpan(
                  text: "/month",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 32.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          Divider(color: AppColors.textPurple),
          SizedBox(height: 12.h),
          ...features.map(_buildFeatureRow).toList(),
        ],
      ),
    );
  }

  Widget _buildFeatureRow(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          Image.asset(AppIcons.check, width: 24.w, height: 24.w),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
