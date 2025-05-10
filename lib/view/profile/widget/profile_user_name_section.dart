import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:streamly/config/icons/icons.dart';
import 'package:streamly/config/images/images.dart';
import 'package:streamly/routes/routes.dart';
import '../../../themes/color.dart';

class ProfileUserNameSection extends StatelessWidget {
  const ProfileUserNameSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 28.r,
          backgroundColor: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28.r),
            child: Image.asset(
              AppImages.user_1,
              width: 56.w,
              height: 56.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Olivia Carter",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                "olivia98@gmail.com",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                  color: AppColors.textPrimary.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(100.r),
          child: Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: const Color(0xff1E092E),
              shape: BoxShape.circle,
            ),
            child: GestureDetector(
              onTap: () {
                context.push(RoutesName.editProfileScreen);
              },
              child: Image.asset(
                AppIcons.edit,
                color: AppColors.textPrimary,
                width: 20.w,
                height: 20.h,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
