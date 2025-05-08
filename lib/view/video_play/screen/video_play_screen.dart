import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../block/content/content_bloc.dart';
import '../../../block/content/content_event.dart';
import '../../../block/content/content_state.dart';
import '../../../repository/content/content_repository.dart';
import '../widgets/comment_tab.dart';
import '../widgets/content_list.dart';
import '../widgets/video_player_widget.dart';

class VideoPlayScreen extends StatelessWidget {
  final bool isEpisode;

  const VideoPlayScreen({Key? key, required this.isEpisode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ContentBloc(repository: ContentRepository())..add(LoadContentEvent(isEpisode: isEpisode)),
      child: Scaffold(
        backgroundColor: const Color(0xFF0B0617),
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
                      child: VideoPlayerWidget(videoUrl: state.selectedItem.videoUrl),
                    ),
                    SizedBox(height: 8.h),
                    DefaultTabController(
                      length: 3,
                      child: Column(
                        children: [
                          Container(
                            height: 40.h,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.transparent),
                              ),
                            ),
                            child: TabBar(
                              labelPadding: EdgeInsets.symmetric(horizontal: 16.w),
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicator: UnderlineTabIndicator(
                                borderSide: BorderSide(width: 2.h, color: Colors.purple),
                                insets: EdgeInsets.symmetric(horizontal: 16.w),

                              ),
                              labelColor: Colors.purple,
                              unselectedLabelColor: Colors.white,
                              labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                              tabs: const [
                                Tab(text: 'Episodes'),
                                Tab(text: 'Seasons'),
                                Tab(text: 'Comments'),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 0.6.sh, // Dynamic half screen height
                            child: TabBarView(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                                      child: Text(
                                        'Episodes',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ContentList(
                                        items: state.items,
                                        selectedId: state.selectedItem.id,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                                      child: Text(
                                        'Season 1',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ContentList(
                                        items: state.items,
                                        selectedId: state.selectedItem.id,
                                      ),
                                    ),
                                  ],
                                ),
                                const CommentTab(),

                                //Center(child: Text('Comments', style: TextStyle(color: Colors.white, fontSize: 14.sp))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else if (state is ContentError) {
                return Center(
                  child: Text('Error: ${state.message}', style: TextStyle(color: Colors.red, fontSize: 14.sp)),
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
