import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../model/movie/movie_model.dart';
import '../../../themes/color.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../model/movie/movie_model.dart';
import '../../../themes/color.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final bool isLarge;
  final bool isSquare;
  final String? iconAsset;
  final bool darkOverlay;

  const MovieCard({
    Key? key,
    required this.movie,
    this.isLarge = false,
    this.isSquare = false,
    this.iconAsset,
    this.darkOverlay = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = isSquare ? 140.w : isLarge ? 160.w : 120.w;
    final double height = isSquare ? 140.h : isLarge ? 200.h : 140.h;

    return Container(
      width: width,
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.network(
                  movie.posterUrl,
                  height: height,
                  width: width,
                  fit: BoxFit.cover,
                ),
              ),
              if (darkOverlay)
                Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    color: AppColors.black.withAlpha(150),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              if (isSquare && iconAsset != null)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      iconAsset!,
                      height: 32.sp,
                      width: 32.sp,
                      color: AppColors.white,
                    ),
                    Text(
                      movie.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
            ],
          ),
          SizedBox(height: 8.h),
          if (iconAsset == null)
            Text(
              movie.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
        ],
      ),
    );
  }
}

