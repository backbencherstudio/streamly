import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:streamly/view/profile/componenst/notification/widget/notification_tile.dart';
import 'package:streamly/widgets/custom_nab_ver.dart';
import '../../../../config/images/images.dart';
import '../../../../themes/color.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});
  @override
  State<NotificationScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<NotificationScreen> {
  bool isDataSaver = false;
  bool isAutoplay = true;
  bool isAutostart = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              AppImages.background,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 32.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      CustomNabVer(title: 'Notification'),
                      SizedBox(height: 24.h),
                      Text(
                        "Manage your notifications.",
                        style: TextStyle(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp),
                      ),
                      SizedBox(height: 10.h),
                      NotificationTile(
                        title: 'General Notification',
                        trailing: CupertinoSwitch(
                          activeColor: AppColors.textPurple,
                          value: isDataSaver,
                          onChanged: (val) => setState(() => isDataSaver = val),
                        ),
                      ),
                      NotificationTile(
                        title: 'Content Recommendations',
                        trailing: CupertinoSwitch(
                          activeColor: AppColors.textPurple,
                          value: isAutostart,
                          onChanged: (val) => setState(() => isAutostart = val),
                        ),
                      ),
                      NotificationTile(
                        title: 'Monthly Newsletter',
                        trailing: CupertinoSwitch(
                          activeColor: AppColors.textPurple,
                          value: isAutoplay,
                          onChanged: (val) => setState(() => isAutoplay = val),
                        ),
                      ),
                      NotificationTile(
                        title: 'New Services Available',
                        trailing: CupertinoSwitch(
                          activeColor: AppColors.textPurple,
                          value: isAutoplay,
                          onChanged: (val) => setState(() => isAutoplay = val),
                        ),
                      ),
                      NotificationTile(
                        title: 'New Releases Movie',
                        trailing: CupertinoSwitch(
                          activeColor: AppColors.textPurple,
                          value: isAutoplay,
                          onChanged: (val) => setState(() => isAutoplay = val),
                        ),
                      ),
                      NotificationTile(
                        title: 'App Updates',
                        trailing: CupertinoSwitch(
                          activeColor: AppColors.textPurple,
                          value: isAutoplay,
                          onChanged: (val) => setState(() => isAutoplay = val),
                        ),
                      ),
                      NotificationTile(
                        title: 'Subscription',
                        trailing: CupertinoSwitch(
                          activeColor: AppColors.textPurple,
                          value: isAutoplay,
                          onChanged: (val) => setState(() => isAutoplay = val),
                        ),
                      ),
                      SizedBox(height: 16.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
