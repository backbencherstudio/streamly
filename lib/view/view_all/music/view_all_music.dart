// Make sure to wrap your MaterialApp with ScreenUtilInit in main.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamly/view/auth/forgot_password/set_new_password_screen.dart';

import '../../../block/music/music_bloc.dart';
import '../../../block/music/music_state.dart';
import '../../../model/music/music_model.dart';
import '../../../themes/color.dart';
import '../../home/widget/header_section.dart';
import '../../library/widgets/search_bar.dart';

class ViewAllMusic extends StatelessWidget {
  const ViewAllMusic({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MusicBloc(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(
            children: [
              const SearchBarLibrary(),
              Expanded(
                child: BlocBuilder<MusicBloc, MusicState>(
                  builder: (context, state) {
                    if (state is MusicLoading) {
                      return const Center(
                        child:
                            CircularProgressIndicator(color: AppColors.primary),
                      );
                    } else if (state is MusicLoaded) {
                      return GridView.builder(
                        padding: EdgeInsets.all(12.w),
                        itemCount: state.musics.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12.h,
                          crossAxisSpacing: 12.w,
                          childAspectRatio: 16 / 12,
                        ),
                        itemBuilder: (context, index) {
                          final music = state.musics[index];
                          return _MusicItem(music: music);
                        },
                      );
                    } else if (state is MusicError) {
                      return Center(
                        child: Text(
                          state.message,
                          style:
                              TextStyle(color: AppColors.red, fontSize: 14.sp),
                        ),
                      );
                    } else {
                      return const Center(child: Text("Unknown state"));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MusicItem extends StatelessWidget {
  final Music music;

  const _MusicItem({required this.music});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.surface,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.network(
              music.thumbnailUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              errorBuilder: (context, error, stackTrace) => Container(
                color: AppColors.grey,
                child: Icon(Icons.error, color: AppColors.red),
              ),
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            ),
          ),
          const Positioned.fill(
            child: Center(
              child: Icon(
                Icons.play_circle_fill,
                size: 48,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          Positioned(
            left: 8.w,
            bottom: 8.h,
            right: 8.w,
            child: Text(
              music.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                color: AppColors.white,
                shadows: [
                  Shadow(
                    blurRadius: 6.r,
                    color: AppColors.black,
                    offset: Offset(0.w, 0.h),
                  )
                ],
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
