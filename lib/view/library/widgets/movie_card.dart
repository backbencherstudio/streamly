import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../model/movie/movie_model.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final bool isLarge;
  final bool isSquare;
  final IconData? iconData;
  final bool darkOverlay;

  const MovieCard({
    Key? key,
    required this.movie,
    this.isLarge = false,
    this.isSquare = false,
    this.iconData,
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
                    color: Colors.black.withAlpha(150),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              if (isSquare && iconData != null)
                Icon(
                  iconData,
                  color: Colors.white,
                  size: 32.sp,
                ),
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            movie.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: isSquare ? 14.sp : 12.sp,
              fontWeight: isSquare ? FontWeight.w500 : FontWeight.normal,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
