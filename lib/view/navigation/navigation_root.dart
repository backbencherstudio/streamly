import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streamly/view/favorite/favorite_screen.dart';
import 'package:streamly/view/library/library_screen.dart';
import 'package:streamly/view/live/live_screen.dart';
import 'package:streamly/view/profile/profile_screen.dart';
import 'package:streamly/widgets/custom_bottom_nav_bar.dart';

import '../../block/bottom_nav/bottom_nav_cubit.dart';
import '../home/home.dart';

class NavigationRoot extends StatelessWidget {
  const NavigationRoot({super.key});

  static final List<Widget> _screens = [
    const Home(),
    const LiveScreen(),
    const LibraryScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, index) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(child: _screens[index]),
          bottomNavigationBar: const CustomBottomNavBar(),
        );
      },
    );
  }
}
