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
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            height: 40.h, // TabBar height
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.transparent),
              ),
            ),
            child: Material(
              elevation: 0, // Removes the shadow/border
              color: Colors.transparent, // Ensures no background color interference
              child: TabBar(
                dividerColor: AppColors.white.withAlpha(40), // Built-in divider
                dividerHeight: 2.h, // Matches UnderlineTabIndicator thickness
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
                padding: EdgeInsets.zero, // Ensure indicator aligns at bottom
                tabs: tabs.map((title) => Tab(text: title)).toList(),
              ),
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