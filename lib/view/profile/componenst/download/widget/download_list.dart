import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DownloadList extends StatelessWidget {
  const DownloadList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      shrinkWrap: true, // Ensures the ListView takes only the space it needs
      physics: const NeverScrollableScrollPhysics(), // Disables ListView's own scrolling
      padding: EdgeInsets.only(bottom: 24.h),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.only(bottom: 6.h),
          padding: EdgeInsets.all(6.w),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.asset(
                  'assets/images/download_1.png', // Replace with your asset
                  height: 112.h,
                  width: 150.w,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lightyear',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white, // Replace with AppColors.textPrimary
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "1h 42m 33s",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey, // Replace with AppColors.buttonText
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xff140620),
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Text(
                            "1.4 GB",
                            style: TextStyle(
                              color: Colors.white, // Replace with AppColors.textPrimary
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            'assets/icons/delete.png', // Replace with your asset
                            height: 30.h,
                            width: 30.w,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}