import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:streamly/routes/routes.dart';

import '../../../../../config/images/images.dart';
import '../../../../../themes/color.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return          Container(
      padding: EdgeInsets.symmetric(
          horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          width: 0.7,
          color: AppColors.secondaryBorderColor,
        ),
      ),
      child: Row(
        children: [
          Image.asset(AppImages.visa_text, width: 50.w),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              "**** **** **** 4289",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              context.push(RoutesName.paymentMethodScreen);
            },
            child: Text(
              "Change",
              style: TextStyle(
                color: AppColors.textPurple,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
