import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:streamly/view/home/components/content_details/widget/cast_crew_list.dart';
import 'package:streamly/view/home/components/content_details/widget/detail_screen_bottom_section.dart';
import 'package:streamly/view/home/components/content_details/widget/detail_screen_header.dart';
import 'package:streamly/view/home/components/content_details/widget/episodes_list.dart';
import 'package:streamly/view/home/components/content_details/widget/trailer_list.dart';
import 'package:streamly/view/home/components/content_details/widget/trailer_tab_view.dart';
import '../../../../config/images/images.dart';
import '../../../../utils/dummy_data.dart';

class ContentDetailScreen extends StatelessWidget {
  const ContentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(AppImages.background, fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailScreenHeader(),
                  SizedBox(height: 16.h),
                  DetailScreenBottomSection(),
                  CastCrewList(people: dummyPeople),
                  SizedBox(height: 16.h),
                  EpisodesList(
                    episodes: dummyEpisodes,
                    onEpisodeTap: (index) {
                      print('Episode $index tapped');
                    },
                  ),
                  SizedBox(height: 16.h),
                 // Expanded(child: TrailerTabView()),



                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
