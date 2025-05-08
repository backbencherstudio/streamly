import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../themes/color.dart';

class LiveAppBar extends StatelessWidget {
  const LiveAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      toolbarHeight: 100.h,
      title: Padding(
        padding: EdgeInsets.only(top: 30.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                height: 40.h,
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.white54, size: 20.sp),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: TextField(
                        style: TextStyle(color: AppColors.textPrimary, fontSize: 14.sp),
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.white54, fontSize: 14.sp),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(Icons.mic, color: Colors.white54, size: 20.sp),
                  ],
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Stack(
              children: [
                Icon(Icons.notifications_none, color: Colors.white, size: 28.sp),
                Positioned(
                  right: 0,
                  top: 2.h,
                  child: Container(
                    width: 10.w,
                    height: 10.h,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
