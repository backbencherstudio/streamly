import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../themes/color.dart';

class VideoTabView extends StatelessWidget {
  final List<String> tabs;
  final List<Widget> tabViews;

  const VideoTabView({
    Key? key,
    required this.tabs,
    required this.tabViews,
  })  : assert(tabs.length == tabViews.length, 'Tabs and Views count must match'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Column(
        children: [
          Container(
            height: 40.h,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.transparent),
              ),
            ),
            child: TabBar(
              labelPadding: EdgeInsets.symmetric(horizontal: 16.w),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 2.h, color: AppColors.textPurple),
                insets: EdgeInsets.symmetric(horizontal: 16.w),
              ),
              labelColor: AppColors.textPurple,
              unselectedLabelColor: AppColors.textPrimary,
              labelStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
              tabs: tabs.map((title) => Tab(text: title)).toList(),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: tabViews,
            ),
          ),
        ],
      ),
    );
  }
}
