import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:streamly/data/bloc/auth/getMe/get_me_bloc.dart';
import 'package:streamly/data/bloc/auth/getMe/get_me_event.dart';
import 'package:streamly/data/bloc/auth/getMe/get_me_state.dart';
import 'package:streamly/data/repository/auth/user/user_repository.dart';
import 'package:streamly/view/favorite/favorite_screen.dart';
import 'package:streamly/view/library/screen/library_screen.dart';
import 'package:streamly/view/live/screen/live_screen.dart';
import 'package:streamly/view/navigation/widget/custom_bottom_nav_bar.dart';

import '../../core/routes/routes.dart';
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
    return BlocProvider(
      create: (context) => GetMeBloc(userRepository: UserRepository())..add(GetMeFetchEvent()),
      child: BlocConsumer<GetMeBloc, GetMeState>(listener: (context, state) {
        if (state is GetMeFailure) {
          context.go(RoutesName.loginScreen);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Please login with remember me again'),
            ),
          );
        }
      }, builder: (context, state) {
        return BlocBuilder<BottomNavCubit, int>(
          builder: (context, index) {
            return Scaffold(
              backgroundColor: AppColors.background,
              body: SafeArea(child: _screens[index]),
              bottomNavigationBar: const CustomBottomNavBar(),
            );
          },
        );
      }),
    );
  }
}
