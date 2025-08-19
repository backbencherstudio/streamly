import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/color.dart';
import '../../../data/bloc/live/live_bloc.dart';
import '../../../data/bloc/live/live_event.dart';


class LiveTabBar extends StatelessWidget {
  final TabFilter currentTab;

  const LiveTabBar({super.key, required this.currentTab});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: TabFilter.values.map((tab) {
        final selected = tab == currentTab;
        final label = tab.name[0].toUpperCase() + tab.name.substring(1);

        return GestureDetector(
          onTap: () => context.read<LiveBloc>().add(ChangeTab(tab)),
          child: Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Container(
              width: 90.w,
              height: 36.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selected ? const Color(0xFF341950) : Colors.transparent,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                label,
                style: TextStyle(
                  color: selected ? AppColors.primary : Colors.white.withOpacity(0.4),
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
