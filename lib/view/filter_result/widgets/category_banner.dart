import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/color.dart';

class CategoryBanner extends StatelessWidget {
  final String backgroundImageUrl;
  final String title;
  final int allCount;
  final int moviesCount;
  final int tvShowsCount;

  const CategoryBanner({
    Key? key,
    required this.backgroundImageUrl,
    required this.title,
    required this.allCount,
    required this.moviesCount,
    required this.tvShowsCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.network(
                  backgroundImageUrl,
                  height: 200.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 200.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.3),
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(0, 2.h),
                        blurRadius: 6.r,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildOutlinedChip('All', allCount),
              _buildOutlinedChip('Movies', moviesCount),
              _buildOutlinedChip('TV shows', tvShowsCount),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOutlinedChip(String label, int count) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(6),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.textBorderColor, width: 1.w),
      ),
      child: Text(
        '$label - $count',
        style: TextStyle(
          color: AppColors.textBorderColor,
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
