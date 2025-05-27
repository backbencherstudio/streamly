import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:streamly/block/bottom_nav/bottom_nav_cubit.dart';
import 'package:streamly/block/comment/comment_bloc.dart';
import 'package:streamly/block/content/content_bloc.dart';
import 'package:streamly/block/library_bloc/library_bloc.dart';
import 'package:streamly/block/live/live_bloc.dart';
import 'package:streamly/block/live_view/live_view_bloc.dart';
import 'package:streamly/block/theme/theme_cubit.dart';
import 'package:streamly/repository/content/content_repository.dart';
import 'package:streamly/routes/app_router.dart';
import 'package:streamly/themes/themes.dart';
import 'package:streamly/block/search_result/search_result_bloc.dart';

import 'block/music/music_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('settings');
  runApp(const AppWrapper());
}

class AppWrapper extends StatelessWidget {
  const AppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => BottomNavCubit()),
        BlocProvider(create: (_) => LiveBloc()),
        BlocProvider(create: (_) => LiveViewBloc()),
        BlocProvider(create: (_) => ContentBloc(repository: ContentRepository())),
        BlocProvider(create: (_) => CommentBloc()),
        BlocProvider(create: (_) => LibraryBloc()),
        BlocProvider(create: (_) => SearchResultBloc()),
        BlocProvider(create: (_) => MusicBloc()),
      ],
      child: const StreamlyApp(),
    );
  }
}

class StreamlyApp extends StatelessWidget {
  const StreamlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) {
            return MaterialApp.router(
              routerConfig: AppRouter.router,
              title: 'Streamly',
              debugShowCheckedModeBanner: false,
              theme: AppThemes.lightTheme,
              darkTheme: AppThemes.darkTheme,
              themeMode: themeMode,
            );
          },
        );
      },
    );
  }
}