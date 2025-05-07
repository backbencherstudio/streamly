import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamly/config/icons/icons.dart';
import 'package:streamly/themes/color.dart';
import '../../../config/images/images.dart';
import '../../../widgets/search_widget.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.home_header),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Search & Notification
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: SearchWidget()),
              SizedBox(width: 12.w),
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Color(0xff472C2A),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(AppIcons.notification,
                    width: 20.w, height: 20.w),
              ),
            ],
          ),

          const Spacer(),

          /// Rating Row
          Row(
            children: [
              Image.asset(AppImages.ibdb),
              SizedBox(width: 8.w),
              Text(
                "6.8/10",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          SizedBox(height: 9.h),

          /// Title
          Text(
            "Companion",
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),

          SizedBox(height: 16.h),

          /// Action Buttons
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: AppColors.textPurple,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  "Watch Now",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Container(
                height: 25.h,
                width: 2,
                color: AppColors.textPrimary,
              ),
              SizedBox(width: 16.w),
              ...[
                AppIcons.download1,
                AppIcons.share,
                AppIcons.copy,
              ].map(
                    (icon) => Padding(
                  padding: EdgeInsets.only(right: 16.w),
                  child: Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: const Color(0xff341E2E),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Image.asset(icon, width: 20.w, height: 20.w),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
