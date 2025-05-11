import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:streamly/config/icons/icons.dart';
import 'package:streamly/routes/routes.dart';
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: SearchWidget()),
              SizedBox(width: 12.w),
              GestureDetector(
                onTap: (){
                  context.push(RoutesName.notificationScreen);
                },
                child: Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                      color: Color(0xff472C2A),
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 1,
                        color: Color(0xff59544d),
                      )),
                  child: Image.asset(AppIcons.notification,
                      width: 20.w, height: 20.w),
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Image.asset(
                AppImages.ibdb,
                height: 24,
                width: 48,
              ),
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
          Text(
            "Companion",
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  context.push(RoutesName.videoPlayScreen);
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 11.h),
                  decoration: BoxDecoration(
                    color: Color(0xff7A25BC),
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
              ),
              SizedBox(width: 16.w),
              Container(
                height: 25.h,
                width: 2,
                color: Color(0xffA3A09D),
              ),
              SizedBox(width: 16.w),
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
        ],
      ),
    );
  }

  Widget _actionIcon(String iconPath, {required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: 7.w),
        child: Container(
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: Color(0xff423144),
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: Image.asset(iconPath, width: 20.w, height: 20.w),
        ),
      ),
    );
  }
}
