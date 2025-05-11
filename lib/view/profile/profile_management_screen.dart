import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:streamly/config/icons/icons.dart';
import 'package:streamly/routes/routes.dart';
import 'package:streamly/themes/color.dart';
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
  String selectedLanguage = 'English';
  String selectedPlan = 'Free';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 32.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 48.h),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     circularIconButton(
              //       AppIcons.backArrow,
              //       onTap: () {
              //         if (context.canPop()) {
              //           context.pop();
              //         } else {
              //           // If no stack, switch to Home tab or handle accordingly
              //           context.read<BottomNavCubit>().updateIndex(0);
              //         }
              //       },
              //     ),
              //     logoutButton(context),
              //   ],
              // ),
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
                suffix: DropdownButton<String>(
                  value: selectedLanguage,
                  underline: const SizedBox(),
                  dropdownColor: const Color(0xFF1A082B),
                  icon: Image.asset(AppIcons.downArrow,
                      width: 16.w, height: 16.h),
                  style: _textStyle(),
                  onChanged: (value) {
                    setState(() {
                      selectedLanguage = value!;
                    });
                  },
                  items: ['English', 'Bangla']
                      .map((lang) => DropdownMenuItem(
                            value: lang,
                            child: Text(lang),
                          ))
                      .toList(),
                ),
                onTap: () {},
              ),
              customContainerWithBackground(
                hintText: "Edit Profile",
                iconPath: AppIcons.profile,
                onTap: () {
                  context.push(RoutesName.editProfileScreen);
                },
              ),
              customContainerWithBackground(
                hintText: "Downloaded",
                iconPath: AppIcons.download,
                onTap: () {
                  context.push(RoutesName.downloadScreen);
                },
              ),
              customContainerWithBackground(
                hintText: "Storage",
                iconPath: AppIcons.storage,
                onTap: () {
                  context.push(RoutesName.storageManagementScreen);
                },
              ),
              customContainerWithBackground(
                hintText: "Current Plan",
                iconPath: AppIcons.plane,
                suffix: DropdownButton<String>(
                  value: selectedPlan,
                  underline: const SizedBox(),
                  dropdownColor: const Color(0xFF1A082B),
                  icon: Image.asset(AppIcons.downArrow,
                      width: 16.w, height: 16.h),
                  style: _textStyle(),
                  onChanged: (value) {
                    setState(() {
                      selectedPlan = value!;
                    });
                  },
                  items: ['Free', 'Premium']
                      .map((plan) => DropdownMenuItem(
                            value: plan,
                            child: Text(plan),
                          ))
                      .toList(),
                ),
                onTap: () {
                  context.push(RoutesName.managePlaneScreen);
                },
              ),
              SizedBox(height: 16.h),
              PrimaryButton(
                  text: 'Upgrade Plan',
                  onTap: () {
                    context.push(RoutesName.managePlaneScreen);
                  }),
              SizedBox(height: 24.h),
              _sectionTitle("Account Security"),
              SizedBox(height: 16.h),
              customContainerWithBackground(
                hintText: "Change Password",
                iconPath: AppIcons.lock,
                onTap: () {
                  context.push(RoutesName.forgotPasswordScreen);
                },
              ),
              SizedBox(height: 16.h),
              customContainerWithBackground(
                hintText: "Settings",
                iconPath: AppIcons.setting,
                onTap: () {
                  context.push(RoutesName.settingScreen);
                },
              ),

              PrimaryButton(
                  text: 'Log Out',
                  onTap: () {
                    context.push(RoutesName.loginScreen);
                  })
            ],
          ),
        ),
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
