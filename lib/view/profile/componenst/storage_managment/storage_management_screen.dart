import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:streamly/config/images/images.dart';
import 'package:streamly/themes/color.dart';
import 'package:streamly/view/profile/componenst/storage_managment/widget/storage_header_section.dart';
import 'package:streamly/view/profile/componenst/storage_managment/widget/storage_list.dart';
import '../../../../config/icons/icons.dart';
import '../../../../widgets/custom_nab_ver.dart';

class StorageManagementScreen extends StatelessWidget {
  const StorageManagementScreen({super.key});

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
                    SizedBox(height: 35.h),
                    CustomNabVer(
                      title: 'Storage Management',
                      trailing: AppIcons.search,
                    ),
                    SizedBox(height: 20.h),
                    StorageHeaderSection(),
                    SizedBox(height: 48.h),
                    Row(
                      children: [
                        Text(
                          "Download",
                          style: TextStyle(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp),
                        ),
                        Spacer(),
                        Text(
                          "Sort",
                          style: TextStyle(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Image.asset(
                          AppIcons.sort,
                          height: 20,
                        )
                      ],
                    ),
                    SizedBox(height: 23.h),
                    StorageList(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
