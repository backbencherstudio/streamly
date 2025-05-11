import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamly/config/icons/icons.dart';
import '../themes/color.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        filled: true,
        fillColor: AppColors.containerBackground,
        hintText: "Search",
        hintStyle: TextStyle(color: AppColors.lightGrey, fontSize: 14.sp),
        prefixIcon: Padding(
          padding: EdgeInsets.all(12.w),
          child: Image.asset(AppIcons.search, width: 20.w, height: 20.h),
        ),
        suffixIcon: SizedBox(
          width: 72.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: Container(
                  height: 23.h,
                  width: 2.w,
                  color: AppColors.lightGrey,
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: AppColors.primaryDark,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(AppIcons.voice, width: 20.w, height: 20.h),
              ),
            ],
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.surface),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide.none,
        ),
      ),
      style: TextStyle(color: AppColors.textPrimary, fontSize: 14.sp),
      cursorColor: AppColors.textPrimary,
    );
  }
}
