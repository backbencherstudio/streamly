import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:streamly/view/home/widget/category_vedio_list.dart';
import 'package:streamly/view/home/widget/header_section.dart';
import 'package:streamly/view/home/widget/movie_carosal.dart';
import '../../../config/images/images.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          /// Background SVG
          Positioned.fill(
            child: SvgPicture.asset(AppImages.background, fit: BoxFit.cover),
          ),

          /// Main Scrollable Content
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeaderSection(),
                  SizedBox(height: 16.h),
                  const MovieCarousel(),
                  SizedBox(height: 16.h),
                  CategoryVideoList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
