import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StorageHeaderSection extends StatelessWidget {
  const StorageHeaderSection({super.key});
  @override
  Widget build(BuildContext context) {
    double usedStorage = 60;
    double totalStorage = 128;
    double percentage = usedStorage / totalStorage;
    return Column(
      children: [
        SizedBox(height: 20.h),
        // Circular Progress
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 160.w,
              height: 160.w,
              child: CircularProgressIndicator(
                value: percentage,
                strokeWidth: 16.w,
                strokeCap: StrokeCap.round,
                backgroundColor: Color(0xff7A25BC),
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF320F4D)),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${usedStorage.toInt()}',
                  style: TextStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'GB Used',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                  ),
                )
              ],
            )
          ],
        ),
        SizedBox(height: 24.h),
        // Storage Info Box
        Container(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
          decoration: BoxDecoration(
            color: Color(0xFF2C0D42),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Total Storage
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total storage",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    '128 GB',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white70,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              // Vertical Divider
              Container(
                width: 1,
                height: 40.h,
                color: Colors.white24,
              ),
              // Free Storage
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Free storage",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    '${(totalStorage - usedStorage).toInt()} GB',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
