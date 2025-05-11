import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamly/themes/color.dart';
import '../../../block/content/content_bloc.dart';
import '../../../block/content/content_event.dart';
import '../../../block/content/content_state.dart';
import '../../../repository/content/content_repository.dart';
import '../widgets/comment_tab.dart';
import '../widgets/content_tab.dart';
import '../widgets/video_player_widget.dart';
import '../widgets/video_tab_view.dart';

class VideoPlayScreen extends StatelessWidget {
  final bool isEpisode;

  const VideoPlayScreen({super.key, required this.isEpisode});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ContentBloc(repository: ContentRepository())..add(LoadContentEvent(isEpisode: isEpisode)),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: BlocBuilder<ContentBloc, ContentState>(
            builder: (context, state) {
              if (state is ContentLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ContentLoaded) {
                return Column(
                  children: [
                    SizedBox(
                      height: 200.h,
                      child: VideoPlayerWidget(videoUrl: state.selectedItem.videoUrl, videoTitle: state.selectedItem.title,),
                    ),
                    SizedBox(height: 8.h),
                    Expanded(
                      child: VideoTabView(
                        tabs: const ['Episodes', 'Seasons', 'Comments'],
                        tabViews: [
                          ContentTab(title: 'Episodes', state: state),
                          ContentTab(title: 'Season 1', state: state),
                          const CommentTab(),
                        ],
                      ),
                    ),
                  ],
                );
              } else if (state is ContentError) {
                return Center(
                  child: Text(
                    'Error: ${state.message}',
                    style: TextStyle(color: Colors.red, fontSize: 14.sp),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
