import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../block/bottom_nav/bottom_nav_cubit.dart';

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
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home, color: Colors.purpleAccent),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wifi_tethering),
          label: 'Live Stream',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.video_library_outlined),
          label: 'Library',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark_border),
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
        ),
      ],
    );
  }
}
