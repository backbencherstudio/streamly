import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamly/data/bloc/content/favorite/favorite_content_bloc.dart';
import 'package:streamly/view/favorite/widget/favorite_card.dart';
import 'package:streamly/view/favorite/widget/favorite_header_section.dart';

import '../../core/constants/icons/icons.dart';
import '../../core/themes/color.dart';
import '../../data/bloc/content/favorite/favorite_content_event.dart';
import '../../data/bloc/content/favorite/favorite_content_state.dart';
import '../../widgets/custom_nab_ver.dart';
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<FavoriteContentBloc>().add(FetchFavContentEvent());
          },
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomNabVer(
                    title: "My Favorites List",
                    fromScreen: 'favorite',
                    trailing: AppIcons.search,
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 16.h)),
              const SliverToBoxAdapter(child: FavoriteHeaderSection()),
              SliverToBoxAdapter(child: SizedBox(height: 16.h)),

              SliverToBoxAdapter(
                child: BlocBuilder<FavoriteContentBloc, FavoriteContentState>(
                  builder: (context, state) {
                    if (state is FavoriteContentLoading) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 48),
                        child: Center(
                          child: CircularProgressIndicator(color: AppColors.white),
                        ),
                      );
                    }

                    if (state is FavoriteContentError) {
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Text(
                              state.message,
                              style: TextStyle(color: AppColors.textPrimary, fontSize: 14.sp),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 12.h),
                          ],
                        ),
                      );
                    }

                    if (state is FavoriteContentLoaded) {
                      final items = state.favoriteContent;
                      if (items.isEmpty) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 48),
                          child: Center(
                            child: Text(
                              'No favorites yet',
                              style: TextStyle(color: AppColors.textPrimary, fontSize: 14.sp),
                            ),
                          ),
                        );
                      }

                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.all(16.w),
                        itemCount: items.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12.w,
                          mainAxisSpacing: 12.h,
                          childAspectRatio: 3 / 4,
                        ),
                        itemBuilder: (context, index) {
                          final m = items[index];
                          return FavoriteCard(
                            // adapt to your FavoriteCard props
                            title: m.title,
                            // prefer a full URL from backend; if it’s just a filename, build it:
                            imageUrl: m.thumbnail, // or '${Env.cdnBase}/${m.thumbnail}'
                            rating: (m.rating is num) ? (m.rating as num).toDouble() : null,
                            badge: m.category?.name,
                            onTap: () {
                              // navigate to details using m.contentId / m.id
                            },
                          );
                        },
                      );
                    }

                    // Initial
                    return const SizedBox.shrink();
                  },
                ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: 16.h)),
              // SliverToBoxAdapter(
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 16.w),
              //     child: Text(
              //       "Recommended to Download",
              //       style: TextStyle(
              //         color: AppColors.textPrimary,
              //         fontSize: 16.sp,
              //         fontWeight: FontWeight.w500,
              //       ),
              //     ),
              //   ),
              // ),
              SliverToBoxAdapter(child: SizedBox(height: 16.h)),
            ],
          ),
        ),
      ),
    );
  }
}

