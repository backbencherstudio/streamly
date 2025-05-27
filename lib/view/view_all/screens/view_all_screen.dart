import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../block/view_all/view_all_bloc.dart';
import '../../../block/view_all/view_all_state.dart';
import '../../../model/music/music_model.dart';
import '../../../routes/routes.dart';
import '../../../themes/color.dart';
import '../../library/widgets/search_bar.dart';

class ViewAllScreen extends StatelessWidget {
  const ViewAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewAllBloc(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(
            children: [
              const SearchBarLibrary(),
              Expanded(
                child: BlocBuilder<ViewAllBloc, ViewAllState>(
                  builder: (context, state) {
                    if (state is ViewAllLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      );
                    } else if (state is ViewAllLoaded) {
                      return GridView.builder(
                        padding: EdgeInsets.all(12.w),
                        itemCount: state.musics.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12.h,
                          crossAxisSpacing: 12.w,
                          childAspectRatio: 172 / 168,
                        ),
                        itemBuilder: (context, index) {
                          final music = state.musics[index];
                          return _MusicItem(
                            music: music,
                            onTap: () {
                              context.push(RoutesName.contentDetailScreen);
                            },
                          );
                        },
                      );
                    } else if (state is ViewAllError) {
                      return Center(
                        child: Text(
                          state.message,
                          style: TextStyle(
                            color: AppColors.red,
                            fontSize: 14.sp,
                          ),
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
  final VoidCallback onTap;

  const _MusicItem({required this.music, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.network(
                music.thumbnailUrl,
                width: 172.w,
                height: 120.h,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 172.w,
                  height: 120.h,
                  color: AppColors.grey,
                  child: const Icon(Icons.error, color: AppColors.red),
                ),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return SizedBox(
                    width: 172.w,
                    height: 120.h,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Text(
                music.title,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
