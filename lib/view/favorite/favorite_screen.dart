import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamly/view/favorite/widget/favorite_card.dart';
import 'package:streamly/view/favorite/widget/favorite_header_section.dart';

import '../../core/constants/icons/icons.dart';
import '../../core/constants/images/images.dart';
import '../../core/themes/color.dart';
import '../../widgets/custom_nab_ver.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> favoriteData = [
      {
        "rating": 9.1,
        "title": "Companion",
        "imageUrl": AppImages.favorite_1,
      },
      {
        "rating": 9.4,
        "title": "Armor",
        "imageUrl": AppImages.favorite_2,
      },
      {
        "rating": 9.5,
        "title": "The Lake",
        "imageUrl": AppImages.favorite_3,
      },
      {
        "rating": 9.8,
        "title": "Streamly Originals",
        "imageUrl": AppImages.favorite_1,
      },
      {
        "rating": 9.1,
        "title": "Companion",
        "imageUrl": AppImages.favorite_3,
      },
      {
        "rating": 9.4,
        "title": "Armor",
        "imageUrl": AppImages.favorite_4,
      },
      {
        "rating": 9.5,
        "title": "The Lake",
        "imageUrl": AppImages.favorite_1,
      },
      {
        "rating": 9.8,
        "title": "Streamly Originals",
        "imageUrl": AppImages.favorite_4,
      }
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CustomNabVer(
                title: "My Favorites List",
                fromScreen: 'favorite',
                trailing: AppIcons.search,
              ),
            ),
            SizedBox(height: 16.h),
            FavoriteHeaderSection(),
            SizedBox(height: 16.h),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(16.w),
              itemCount: favoriteData.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
                childAspectRatio: 3 / 4,
              ),
              itemBuilder: (context, index) {
                return FavoriteCard(
                  data: favoriteData[index],
                );
              },
            ),
            SizedBox(height: 16.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                "Recommended to Download",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 16.h,),
          ],
        ),
      ),
    );
  }
}
