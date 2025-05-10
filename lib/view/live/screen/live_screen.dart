import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamly/view/live/widgets/live_card_grid.dart';
import 'package:streamly/view/live/widgets/live_tab_bar.dart';

import '../../../block/live/live_bloc.dart';
import '../../../block/live/live_event.dart';
import '../../../block/live/live_state.dart';
import '../../../model/live/live_model.dart';
import '../../../themes/color.dart';
import '../app_bar/live_app_bar.dart';


class LiveScreen extends StatelessWidget {
  const LiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LiveBloc()..add(LoadLiveUsers()),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: LiveAppBar(),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<LiveBloc, LiveState>(
                builder: (context, state) {
                  final selectedTab = state is LiveLoaded ? state.selectedTab : TabFilter.all;
                  return LiveTabBar(currentTab: selectedTab);
                },
              ),
              SizedBox(height: 20.h),
              Text(
                'Ongoing Live Stream',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12.h),
              const Expanded(child: LiveCardGrid()),
            ],
          ),
        ),
      ),
    );
  }
}
