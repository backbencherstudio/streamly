import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../model/movie/category_model.dart';
import '../../../routes/routes.dart';
import 'movie_card.dart';

class CategorySection extends StatelessWidget {
  final Category category;

  const CategorySection({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final bool isComingSoon = category.title.toLowerCase().contains("coming soon");
    final bool isPopularGenres = category.title.toLowerCase() == "popular genres";

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
                return GestureDetector(
                  onTap: () => context.push(RoutesName.contentDetailScreen),
                  child: MovieCard(
                    movie: movie,
                    isLarge: isComingSoon,
                    isSquare: isPopularGenres,
                    iconData: isPopularGenres ? _getGenreIcon(movie.title) : null,
                    darkOverlay: isPopularGenres,
                    key: ValueKey(movie.title),
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
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (!hideViewAll)
            TextButton(
              onPressed: () {
                // Navigate to the full list of movies in this category
                 context.push(RoutesName.filterResult);
              },
              child: Text(
                'View All',
                style: TextStyle(
                  color: Colors.purpleAccent,
                  fontSize: 12.sp,
                ),
              ),
            ),
        ],
      ),
    );
  }

  IconData _getGenreIcon(String title) {
    switch (title.toLowerCase()) {
      case "tv shows":
        return Icons.mic;
      case "movies":
        return Icons.movie;
      case "streamly original":
        return Icons.play_circle_filled;
      default:
        return Icons.category;
    }
  }
}
