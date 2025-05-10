import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../themes/color.dart';

Widget logoutButton(BuildContext context) {
  return GestureDetector(
    onTap: (){
      context.go('/loginScreen');
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 9.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: const Color(0xff1E092E),
      ),
      child: Text(
        "Log Out",
        style: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}