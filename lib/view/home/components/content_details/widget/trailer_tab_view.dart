import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamly/view/home/components/content_details/widget/trailer_card.dart';

import '../../../../../model/content_details/trailer.dart';

class TrailerList extends StatelessWidget {
  final List<Trailer> trailers;
  final Function(int index) onTap;

  const TrailerList({
    super.key,
    required this.trailers,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      itemCount: trailers.length,
      separatorBuilder: (_, __) => SizedBox(height: 16.h),
      itemBuilder: (context, index) {
        return TrailerCard(
          trailer: trailers[index],
          onTap: () => onTap(index),
        );
      },
    );
  }
}

// --- MAIN TAB VIEW SCREEN ---
class TrailerTabView extends StatefulWidget {
  const TrailerTabView({super.key});

  @override
  State<TrailerTabView> createState() => _TrailerTabViewState();
}

class _TrailerTabViewState extends State<TrailerTabView> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<Trailer> trailers;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    trailers = [
      Trailer(
        title: 'Trailer 2: Final',
        duration: '1m 56s',
        thumbnailUrl: 'https://i.imgur.com/9CzKxAV.png',
        isSelected: true,
      ),
      Trailer(
        title: 'Trailer 1',
        duration: '1m 46s',
        thumbnailUrl: 'https://i.imgur.com/Ly9VZ5F.png',
      ),
    ];
  }

  void onTrailerTap(int index) {
    setState(() {
      trailers = trailers
          .asMap()
          .entries
          .map((entry) => entry.value.copyWith(isSelected: entry.key == index))
          .toList();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              indicatorColor: Colors.deepPurpleAccent,
              indicatorWeight: 3,
              labelColor: Colors.deepPurpleAccent,
              unselectedLabelColor: Colors.white.withOpacity(0.6),
              labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              tabs: const [
                Tab(text: 'Trailer'),
                Tab(text: 'Seasons'),
                Tab(text: 'Comments'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  TrailerList(trailers: trailers, onTap: onTrailerTap),
                  Center(child: Text('Seasons', style: TextStyle(color: Colors.white))),
                  Center(child: Text('Comments', style: TextStyle(color: Colors.white))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}