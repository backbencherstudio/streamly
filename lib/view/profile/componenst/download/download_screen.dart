import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:streamly/view/profile/componenst/download/widget/download_list.dart';
import 'package:streamly/widgets/custom_nab_ver.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Background SVG
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/images/background.svg', // Replace with your asset
              fit: BoxFit.cover,
            ),
          ),
          // Main Scrollable Content
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 35.h),
                    CustomNabVer(
                      title: 'Download',
                      trailing:
                          'assets/icons/search.png', // Replace with your icon asset
                    ),
                    SizedBox(height: 20.h),
                    const DownloadList(), // Removed Expanded
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
