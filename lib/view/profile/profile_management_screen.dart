import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:streamly/config/icons/icons.dart';
import 'package:streamly/config/images/images.dart';
import 'package:streamly/themes/color.dart';
import 'package:streamly/view/profile/widget/circular_iton_button.dart';
import 'package:streamly/view/profile/widget/log_out_button.dart';
import 'package:streamly/view/profile/widget/profile_user_name_section.dart';
import 'package:streamly/widgets/custom_text_field_with_background.dart';
import 'package:streamly/widgets/primary_button.dart';

class ProfileManagementScreen extends StatefulWidget {
  const ProfileManagementScreen({super.key});

  @override
  State<ProfileManagementScreen> createState() =>
      _ProfileManagementScreenState();
}

class _ProfileManagementScreenState extends State<ProfileManagementScreen> {
  bool isKidsMode = false;
  bool isAutostart = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          /// Background
          Positioned.fill(
            child: SvgPicture.asset(AppImages.background, fit: BoxFit.cover),
          ),

          /// Foreground Content
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 32.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 48.h),

                    /// Top Bar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        circularIconButton(
                          AppIcons.backArrow,
                          onTap: () => Navigator.of(context).pop(),
                        ),
                        logoutButton(),
                      ],
                    ),
                    SizedBox(height: 32.h),
                    const ProfileUserNameSection(),
                    SizedBox(height: 24.h),
                    _sectionTitle("Preferences"),
                    SizedBox(height: 16.h),
                    customContainerWithBackground(
                      hintText: "Kids Mode",
                      iconPath: AppIcons.kids,
                      suffix: Transform.scale(
                        scale: 1,
                        child: CupertinoSwitch(
                          activeTrackColor: AppColors.textPurple,
                          value: isKidsMode,
                          onChanged: (val) => setState(() => isKidsMode = val),
                        ),
                      ),
                      onTap: () {},
                    ),
                    customContainerWithBackground(
                      hintText: "Languages",
                      iconPath: AppIcons.language,
                      suffix: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("English", style: _textStyle()),
                          SizedBox(width: 4.w),
                          Image.asset(AppIcons.downArrow,
                              width: 16.w, height: 16.h),
                        ],
                      ),
                      onTap: () {},
                    ),
                    customContainerWithBackground(
                      hintText: "Downloaded",
                      iconPath: AppIcons.download,
                      onTap: () {
                        context.go('/downloadScreen');
                      },
                    ),
                    customContainerWithBackground(
                      hintText: "Storage",
                      iconPath: AppIcons.storage,
                      suffix: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(width: 4.w),
                          Image.asset(AppIcons.downArrow,
                              width: 16.w, height: 16.h),
                        ],
                      ),
                      onTap: () {
                        context.go('/storageManagementScreen');
                      },
                    ),
                    customContainerWithBackground(
                      hintText: "Current Plan",
                      iconPath: AppIcons.plane,
                      suffix: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Plan", style: _textStyle()),
                          SizedBox(width: 4.w),
                          Image.asset(AppIcons.downArrow,
                              width: 16.w, height: 16.h),
                        ],
                      ),
                      onTap: () {
                        context.go('/managePlaneScreen');
                      },
                    ),

                    SizedBox(height: 16.h),
                    PrimaryButton(text: 'Upgrade Plan', onTap: () {}),

                    SizedBox(height: 24.h),
                    _sectionTitle("Account Security"),
                    SizedBox(height: 16.h),

                    customContainerWithBackground(
                      hintText: "Change Password",
                      iconPath: AppIcons.lock,
                      onTap: () {
                        context.go('/forgotPasswordScreen');
                      },
                    ),
                    SizedBox(height: 16.h),
                    customContainerWithBackground(
                      hintText: "Settings",
                      iconPath: AppIcons.setting,
                      onTap: () {
                        context.go('/settingScreen');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle _textStyle() => TextStyle(color: Colors.white, fontSize: 14.sp);

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w500,
        fontSize: 18.sp,
      ),
    );
  }
}
