import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:streamly/view/profile/componenst/setting/widget/setting_title.dart';
import 'package:streamly/widgets/custom_nab_ver.dart';
import 'package:streamly/widgets/primary_button.dart';

import '../../../../core/constants/images/images.dart';
import '../../../../core/themes/color.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isDataSaver = false;
  bool isAutoplay = true;
  bool isAutostart = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background
          Positioned.fill(
            child: Image.asset(AppImages.background, fit: BoxFit.cover),
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
                      CustomNabVer(title: 'Settings'),
                      SizedBox(height: 10.h),
                      SettingTile(
                        title: 'Data Saver',
                        trailing: CupertinoSwitch(
                          activeColor: AppColors.textPurple,
                          value: isDataSaver,
                          onChanged: (val) => setState(() => isDataSaver = val),
                        ),
                      ),
                      SettingTile(
                        title: 'Autostart',
                        trailing: CupertinoSwitch(
                          activeColor: AppColors.textPurple,
                          value: isAutostart,
                          onChanged: (val) => setState(() => isAutostart = val),
                        ),
                      ),
                      SettingTile(
                        title: 'Autoplay',
                        trailing: CupertinoSwitch(
                          activeColor: AppColors.textPurple,
                          value: isAutoplay,
                          onChanged: (val) => setState(() => isAutoplay = val),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      SettingTile(
                          title: 'Notifications',
                          onTap: () {
                            context.push('/notificationScreen');
                          }),
                      SettingTile(title: 'Profile', onTap: () {}),
                      Divider(color: const Color(0xff1C082B)),
                      SettingTile(title: 'Captions', onTap: () {}),
                      SettingTile(title: 'Privacy Center', onTap: () {}),
                      SettingTile(
                          title: 'Activate Streamly on Your TV', onTap: () {}),
                      SettingTile(
                          title: 'Help & Support',
                          onTap: () {
                            context.push('/helpSupportScreen');
                          }),
                      SettingTile(title: 'Delete Account', onTap: () {}),
                      SizedBox(height: 40.h),
                      PrimaryButton(
                        text: 'Log Out',
                        onTap: () {},
                      ),
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
