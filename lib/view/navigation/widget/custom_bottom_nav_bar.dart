import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streamly/config/icons/icons.dart';

import '../../../block/bottom_nav/bottom_nav_cubit.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = context.select((BottomNavCubit cubit) => cubit.state);

    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (index) => context.read<BottomNavCubit>().updateIndex(index),
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      selectedItemColor: Colors.purpleAccent,
      unselectedItemColor: Colors.white70,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            AppIcons.home,
            height: 24,
            color: Colors.white70,
          ),
          activeIcon: Image.asset(
            AppIcons.home,
            height: 24,
            color: Colors.purpleAccent,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            AppIcons.live,
            height: 24,
            color: Colors.white70,
          ),
          activeIcon: Image.asset(
            AppIcons.live,
            height: 24,
            color: Colors.purpleAccent,
          ),
          label: 'Live Stream',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            AppIcons.library,
            height: 24,
            color: Colors.white70,
          ),
          activeIcon: Image.asset(
            AppIcons.library,
            height: 24,
            color: Colors.purpleAccent,
          ),
          label: 'Library',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            AppIcons.favorite,
            height: 24,
            color: Colors.white70,
          ),
          activeIcon: Image.asset(
            AppIcons.favorite,
            height: 24,
            color: Colors.purpleAccent,
          ),
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
          AppIcons.profile,
            height: 24,
            color: Colors.white70,
          ),
          activeIcon: Image.asset(
            AppIcons.profile,
            height: 24,
            color: Colors.purpleAccent,
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
