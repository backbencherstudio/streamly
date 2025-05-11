import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamly/themes/color.dart';

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
