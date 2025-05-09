import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:streamly/config/icons/icons.dart';
import 'package:streamly/themes/color.dart';

class DetailScreenBottomSection extends StatelessWidget {
  const DetailScreenBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hip Hop Road Redemption",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 20.w),
              SizedBox(width: 4.w),
              Text(
                "6.8",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 8.w),
              Image.asset(AppIcons.rightArrow, width: 12.w),
              SizedBox(width: 8.w),
              Text(
                "2025",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 12.w),
              _tagBox("Subtitle"),
              SizedBox(width: 8.w),
              _tagBox("United States"),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: AppColors.textPurple,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        AppIcons.start,
                        width: 20.w,
                        height: 20.w,
                        color: Colors.white,
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        "Play",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Container(
                height: 30.h,
                width: 1,
                color: AppColors.textPurple,
              ),
              SizedBox(width: 12.w),
              _actionIcon(AppIcons.download1, onTap: () {}),
              SizedBox(width: 8.w),
              _actionIcon(AppIcons.share, onTap: () {
                Share.share(
                  'https://play.google.com/store/apps/details?id=com.example.streamly',
                );
              }),
              SizedBox(width: 8.w),
              _actionIcon(AppIcons.copy, onTap: () {}),
            ],
          ),
          SizedBox(height: 20.h),
          Text(
            "Genre: Drama, Music, Action",
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            "Synopsis",
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.h),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text:
                      "Join Jamal, a gifted street dancer, as he overcomes challenges, rivalries, and personal struggles in a vibrant hip-hop journey filled with electrifying battles and raw emotion... ",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.textPrimary,
                    height: 1.5,
                  ),
                ),
                TextSpan(
                  text: "View More",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.textPurple,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _tagBox(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: AppColors.textPurple),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12.sp,
          color: AppColors.textPurple,
        ),
      ),
    );
  }

  Widget _actionIcon(String iconPath, {required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: const Color(0xff200F2C),
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Image.asset(iconPath, width: 20.w, height: 20.w),
      ),
    );
  }
}
