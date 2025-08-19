import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:streamly/data/bloc/auth/login/login_bloc.dart';
import 'package:streamly/data/bloc/auth/rememberMe/remember_me_cubit.dart';
import 'package:streamly/data/bloc/auth/sign_up/sign_up_bloc.dart';
import 'package:streamly/data/repository/auth/login/login_repository.dart';
import 'package:streamly/data/repository/auth/sign_up/sign_up_repository.dart';
import 'core/routes/app_router.dart';
import 'core/themes/themes.dart';
import 'data/bloc/bottom_nav/bottom_nav_cubit.dart';
import 'data/bloc/comment/comment_bloc.dart';
import 'data/bloc/content/content_bloc.dart';
import 'data/bloc/library_bloc/library_bloc.dart';
import 'data/bloc/live/live_bloc.dart';
import 'data/bloc/live_view/live_view_bloc.dart';
import 'data/bloc/music/music_bloc.dart';
import 'data/bloc/search_result/search_result_bloc.dart';
import 'data/bloc/theme/theme_cubit.dart';
import 'data/repository/content/content_repository.dart';

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
        BlocProvider(create: (_) => SignUpBloc(signUpRepository: SignUpRepository())),
        BlocProvider(create: (_) => LoginBloc(loginRepository: LoginRepository())),
        BlocProvider(create: (_) => RememberMeCubit()),
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