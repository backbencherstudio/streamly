import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../config/icons/icons.dart';
import '../../../../../config/images/images.dart';
import '../../../../../themes/color.dart';

class DownloadList extends StatelessWidget {
  const DownloadList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 8,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
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
                    AppImages.download_1,
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
                      Text('Lightyear',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w600,
                          )),
                      SizedBox(height: 12.h),
                      Text("1h 42m 33s",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.buttonText,
                          )),
                      SizedBox(height: 12.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              color: Color(0xff140620),
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            child: Text("1.4 GB",
                                style: TextStyle(
                                    color: AppColors.textPrimary,
                                    fontSize: 12.sp)),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              AppIcons.delete,
                              height: 30.h,
                              width: 30.w,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
