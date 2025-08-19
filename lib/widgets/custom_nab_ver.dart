import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/icons/icons.dart';
import '../core/themes/color.dart';

class CustomNabVer extends StatelessWidget {
  final String? title;
  final String? trailing;
  final String? fromScreen;
  final VoidCallback? onTap;

  const CustomNabVer({
    super.key,
    this.title,
    this.trailing,
    this.onTap,
    this.fromScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        children: [
          fromScreen == 'favorite'
              ? const SizedBox.shrink()
              : GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryDark,
              ),
              child: Image.asset(
                AppIcons.backArrow,
                width: 20.w,
                height: 20.w,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Text(
              title ?? '',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (trailing != null)
            GestureDetector(
              onTap: onTap,
              child: Image.asset(
                trailing!,
                height: 23.h,
              ),
            ),
        ],
      ),
    );
  }
}
