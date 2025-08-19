import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streamly/view/favorite/favorite_screen.dart';
import 'package:streamly/view/library/screen/library_screen.dart';
import 'package:streamly/view/live/screen/live_screen.dart';
import 'package:streamly/view/navigation/widget/custom_bottom_nav_bar.dart';

import '../../core/themes/color.dart';
import '../../data/bloc/bottom_nav/bottom_nav_cubit.dart';
import '../home/home.dart';
import '../profile/profile_management_screen.dart';

class NavigationRoot extends StatelessWidget {
  const NavigationRoot({super.key});

  static final List<Widget> _screens = [
    const Home(),
    LiveScreen(),
    LibraryScreen(),
    const FavoriteScreen(),
    const ProfileManagementScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, index) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(child: _screens[index]),
          bottomNavigationBar: const CustomBottomNavBar(),
        );
      },
    );
  }
}
