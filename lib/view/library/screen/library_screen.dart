import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:streamly/routes/routes.dart';

import '../../../block/library_bloc/library_bloc.dart';
import '../../../block/library_bloc/library_event.dart';
import '../../../block/library_bloc/library_state.dart';
import '../../../model/movie/category_model.dart';
import '../../../model/movie/movie_model.dart';

class LibraryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LibraryBloc()..add(LoadLibrary()),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: SvgPicture.asset(
                'assets/images/background.svg',
                fit: BoxFit.cover,
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  _buildSearchBar(),
                  Expanded(
                    child: BlocBuilder<LibraryBloc, LibraryState>(
                      builder: (context, state) {
                        if (state is LibraryLoading) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (state is LibraryLoaded) {
                          return ListView.builder(
                            padding: EdgeInsets.only(bottom: 16.h),
                            itemCount: state.categories.length,
                            itemBuilder: (context, index) {
                              final category = state.categories[index];
                              return CategorySection(category: category, key: ValueKey(category.title));
                            },
                          );
                        } else if (state is LibraryError) {
                          return Center(
                            child: Text(
                              state.message,
                              style: TextStyle(color: Colors.white, fontSize: 14.sp),
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.all(12.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: TextField(
          style: TextStyle(color: Colors.white, fontSize: 14.sp),
          decoration: InputDecoration(
            icon: Icon(Icons.search, color: Colors.white, size: 20.sp),
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class CategorySection extends StatelessWidget {
  final Category category;

  const CategorySection({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final bool isComingSoon = category.title.toLowerCase().contains("coming soon");
    final bool isPopularGenres = category.title.toLowerCase() == "popular genres";

    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context, category.title, isPopularGenres),
          SizedBox(
            height: isComingSoon ? 260.h : 215.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: category.movies.length,
              itemBuilder: (context, index) {
                final movie = category.movies[index];
                return GestureDetector(
                  onTap: () {
                    context.push(RoutesName.videoPlayScreen);
                    // Replace this with actual navigation or action
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(content: Text('Tapped on ${movie.title}')),
                    // );
                  },
                  child: MovieCard(
                    movie: movie,
                    isLarge: isComingSoon,
                    isSquare: isPopularGenres,
                    iconData: isPopularGenres ? _getGenreIcon(movie.title) : null,
                    darkOverlay: isPopularGenres,
                    key: ValueKey(movie.title),
                  ),
                );
              },
            ),
          ),
        ],
      ),
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
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (!hideViewAll)
            TextButton(
              onPressed: () {},
              child: Text(
                'View All',
                style: TextStyle(
                  color: Colors.purpleAccent,
                  fontSize: 14.sp,
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
                    color: Colors.black.withOpacity(0.5),
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
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: isSquare ? 36.h : 28.h),
            child: Text(
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
          ),
        ],
      ),
    );
  }
}
