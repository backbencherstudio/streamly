import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamly/themes/color.dart';
import 'package:streamly/view/home/components/content_details/widget/detail_screen_bottom_section.dart';
import 'package:streamly/view/home/components/content_details/widget/detail_screen_header.dart';

class ContentDetailScreen extends StatelessWidget {
  const ContentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: false,

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailScreenHeader(),
            SizedBox(height: 16.h),
            DetailScreenBottomSection()
          ],
        ),
      ),
    );
  }
}
