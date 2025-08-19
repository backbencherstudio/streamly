import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/icons/icons.dart';
import '../../../core/themes/color.dart';
import '../../../data/bloc/bottom_nav/bottom_nav_cubit.dart';


class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = context.select((BottomNavCubit cubit) => cubit.state);

    return Padding(
      padding: EdgeInsets.only(top: 0.h),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.background,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(25),
                blurRadius: 10,
                offset: Offset(0, -3),
              ),
            ],
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
            ),
            child: Material(
              type: MaterialType.transparency,
              child: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (index) => context.read<BottomNavCubit>().updateIndex(index),
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                selectedItemColor: AppColors.textPurple,
                unselectedItemColor: AppColors.textPrimary.withAlpha(135),
                selectedFontSize: 11.sp,
                unselectedFontSize: 11.sp,
                items: [
                  _buildNavItem(AppIcons.home, 'Home', selectedIndex == 0),
                  _buildNavItem(AppIcons.live, 'Live', selectedIndex == 1),
                  _buildNavItem(AppIcons.library, 'Library', selectedIndex == 2),
                  _buildNavItem(AppIcons.favorite, 'Favorites', selectedIndex == 3),
                  _buildNavItem(AppIcons.profile, 'Profile', selectedIndex == 4),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(String iconPath, String label, bool isSelected) {
    return BottomNavigationBarItem(
      icon: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.only(top: isSelected ? 0 : 0.h),
        child: Container(
          decoration: isSelected
              ? BoxDecoration(
            color: AppColors.textPurple.withAlpha(50),
            borderRadius: BorderRadius.circular(50.r),
          )
              : null,
          padding: EdgeInsets.all(10.w),
          child: Image.asset(
            iconPath,
            height: 24.h,
            color: isSelected
                ? AppColors.textPurple
                : AppColors.textPrimary.withAlpha(135),
          ),
        ),
      ),
      label: label,
    );
  }
}
