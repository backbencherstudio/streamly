import 'package:flutter/material.dart';
import 'package:streamly/themes/color.dart';

import '../../library/widgets/search_bar.dart';
import '../widgets/category_banner.dart';
import '../widgets/movie_category_list.dart';

class FilterResultScreen extends StatelessWidget {
  const FilterResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchBarLibrary(),
              CategoryBanner(
                backgroundImageUrl:
                    'https://image.tmdb.org/t/p/w500/9dKCd55IuTT5QRs989m9Qlb7d2B.jpg',
                title: 'Adventure',
                allCount: 42639,
                moviesCount: 22646,
                tvShowsCount: 19993,
              ),
              SearchResultWidget()
            ],
          ),
        ),
      ),
    );
  }
}
