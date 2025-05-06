import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:streamly/config/icons/icons.dart';
import 'package:streamly/config/images/images.dart';
import 'package:streamly/themes/color.dart';
import 'package:streamly/view/profile/widget/circular_iton_button.dart';
import 'package:streamly/view/profile/widget/log_out_button.dart';
import 'package:streamly/view/profile/widget/profile_user_name_section.dart';
import 'package:streamly/widgets/primary_button.dart';
import '../../widgets/custom_text_field_with_background.dart';

class ProfileManagementScreen extends StatelessWidget {
  const ProfileManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(AppImages.background, fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 48.h),
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
                    Text(
                      "Preferences",
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // Preferences
                    customTextFieldWithBackground(
                      hintText: "Kids Mode",
                      iconPath: AppIcons.kids,
                      suffix: Image.asset(
                        AppIcons.SwitchIcon,
                        width: 35.w,
                        height: 24.h,
                      ),
                    ),
                    customTextFieldWithBackground(
                      hintText: "Languages",
                      iconPath: AppIcons.language,
                      suffix: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("English", style: _textStyle()),
                          SizedBox(width: 4.w),
                          Image.asset(
                            AppIcons.downArrow,
                            width: 16.w,
                            height: 16.h,
                          ),
                        ],
                      ),
                    ),
                    customTextFieldWithBackground(
                      hintText: "Downloaded",
                      iconPath: AppIcons.download,
                    ),
                    customTextFieldWithBackground(
                      hintText: "Current Plan",
                      iconPath: AppIcons.plane,
                      suffix: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Plan", style: _textStyle()),
                          SizedBox(width: 4.w),
                          Image.asset(
                            AppIcons.downArrow,
                            width: 16.w,
                            height: 16.h,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),

                    PrimaryButton(text: 'Upgrade Plan', onTap: () {}),
                    SizedBox(height: 24.h),
                    Text(
                      "Account Security",
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    customTextFieldWithBackground(
                      hintText: "Change Password",
                      iconPath: AppIcons.lock,
                    ),
                    SizedBox(height: 16.h),
                    customTextFieldWithBackground(
                      hintText: "Settings",
                      iconPath: AppIcons.setting,
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

  TextStyle _textStyle() {
    return TextStyle(color: Colors.white, fontSize: 14.sp);
  }
}
