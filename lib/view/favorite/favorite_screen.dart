import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:streamly/view/favorite/widget/favorite_card.dart';
import '../../config/icons/icons.dart';
import '../../config/images/images.dart';
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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(AppImages.background, fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomNabVer(
                    title: "My List",
                    trailing:AppIcons.search,
                  ),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
