import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../model/live_view/live_view_model.dart';
import '../../../themes/color.dart';

class LiveViewHeader extends StatelessWidget {
  final LiveViewModel model;

  const LiveViewHeader({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40.h,
      left: 16.w,
      right: 16.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: AppColors.black.withOpacity(0.45),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 14.r,
                  backgroundImage: NetworkImage(model.userImage),
                ),
                SizedBox(width: 8.w),
                Text(
                  model.userName,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(width: 12.w),
                Icon(
                  Icons.remove_red_eye,
                  color: AppColors.lightGrey,
                  size: 16.sp,
                ),
                SizedBox(width: 4.w),
                Text(
                  model.viewers,
                  style: TextStyle(
                    color: AppColors.lightGrey,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              padding: EdgeInsets.all(6.w),
              decoration: BoxDecoration(
                color: AppColors.black.withOpacity(0.45),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.close,
                color: AppColors.textPrimary,
                size: 20.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
