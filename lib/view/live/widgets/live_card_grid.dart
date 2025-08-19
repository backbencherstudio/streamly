import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/bloc/live/live_bloc.dart';
import '../../../data/bloc/live/live_state.dart';
import 'live_card_item.dart';

class LiveCardGrid extends StatelessWidget {
  const LiveCardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LiveBloc, LiveState>(
      builder: (context, state) {
        if (state is LiveLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LiveLoaded) {
          return GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 16.h,
            crossAxisSpacing: 16.w,
            childAspectRatio: 0.68,
            children: state.users.map((user) => LiveCardItem(user: user)).toList(),
          );
        } else if (state is LiveError) {
          return Center(child: Text(state.message, style: const TextStyle(color: Colors.red)));
        }
        return Container();
      },
    );
  }
}
