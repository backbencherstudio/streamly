import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../model/movie/category_model.dart';
import '../../../routes/routes.dart';
import '../../../themes/color.dart';
import '../../library/widgets/movie_card.dart';


class CategorySectionForHome extends StatelessWidget {
  final Category category;

  const CategorySectionForHome({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final bool isComingSoon = category.title.toLowerCase().contains("coming soon");
    final bool isPopularGenres = category.title.toLowerCase() == "popular categories";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(context, category.title, isPopularGenres),
        SizedBox(
          height: isComingSoon ? 260.h : 215.h,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: category.movies.map((movie) {
                return Padding(
                  padding: EdgeInsets.only(left: 12.w),
                  child: GestureDetector(
                    onTap: () => isPopularGenres
                        ? context.push(RoutesName.viewAllMusic)
                        : context.push(RoutesName.contentDetailScreen),
                    child: MovieCard(
                      movie: movie,
                      isLarge: isComingSoon,
                      isSquare: isPopularGenres,
                      iconAsset: isPopularGenres ? _getGenreAsset(movie.title) : null,
                      darkOverlay: isPopularGenres,
                      key: ValueKey(movie.title),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context, String title, bool hideViewAll) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (!hideViewAll)
            TextButton(
              onPressed: () => context.push(RoutesName.viewAll),
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              ),
              child: Text(
                'View All',
                style: TextStyle(
                  color: AppColors.textPurple,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
    );
  }

  String _getGenreAsset(String title) {
    switch (title.toLowerCase()) {
      case "music videos":
        return 'assets/icons/music_videos.png';
      case "tv shows":
        return 'assets/icons/tv_shows.png';
      case "movies":
        return 'assets/icons/movies.png';
      default:
        return 'assets/icons/movies.png';
    }
  }
}
