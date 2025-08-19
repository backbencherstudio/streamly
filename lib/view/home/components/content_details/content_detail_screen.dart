import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:streamly/view/home/components/content_details/widget/cast_crew_list.dart';
import 'package:streamly/view/home/components/content_details/widget/detail_screen_bottom_section.dart';
import 'package:streamly/view/home/components/content_details/widget/detail_screen_header.dart';
import 'package:streamly/view/home/components/content_details/widget/episodes_list.dart';
import '../../../../core/constants/images/images.dart';
import '../../../../core/themes/color.dart';
import '../../../../core/utils/dummy_data.dart';
import '../../../../data/bloc/content/content_bloc.dart';
import '../../../../data/bloc/content/content_event.dart';
import '../../../../data/bloc/content/content_state.dart';
import '../../../../data/repository/content/content_repository.dart';
import '../../../video_play/widgets/comment_tab.dart';
import '../../../video_play/widgets/content_tab.dart';
import '../../../video_play/widgets/video_tab_view.dart';

class ContentDetailScreen extends StatelessWidget {
  const ContentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ContentBloc(repository: ContentRepository())
        ..add(LoadContentEvent(isEpisode: true)),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.background,
        body: Stack(
          children: [
            Positioned.fill(
              child: SvgPicture.asset(AppImages.background, fit: BoxFit.cover),
            ),
            Positioned.fill(
              child: SafeArea(
                child: BlocBuilder<ContentBloc, ContentState>(
                  builder: (context, state) {
                    if (state is ContentLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ContentLoaded) {
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DetailScreenHeader(),
                            SizedBox(height: 16.h),
                            DetailScreenBottomSection(),
                            CastCrewList(people: dummyPeople),
                            SizedBox(height: 16.h),
                            Text(
                              "Episodes",
                              style: TextStyle(
                                  color: AppColors.textPrimary,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            EpisodesList(
                              episodes: dummyEpisodes,
                              onEpisodeTap: (index) {
                                print('Episode $index tapped');
                              },
                            ),
                            SizedBox(height: 16.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                            ),
                            SizedBox(
                              height: 400.h,
                              child: VideoTabView(
                                tabs: const ['Episodes', 'Seasons', 'Comments'],
                                tabViews: [
                                  ContentTab(title: '', state: state),
                                  ContentTab(title: ' ', state: state),
                                  const CommentTab(),
                                ],
                              ),
                            ),
                          ],
                        ),
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
          ],
        ),
      ),
    );
  }
}
