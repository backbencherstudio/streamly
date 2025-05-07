import 'package:go_router/go_router.dart';
import 'package:streamly/routes/routes.dart';
import 'package:streamly/view/library/screen/library_screen.dart';

import '../view/auth/login/login_screen.dart';
import '../view/navigation/navigation_root.dart';
import '../view/splash_screen/splash_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: RoutesName.splashScreen,
    routes: [
      GoRoute(
        path: RoutesName.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RoutesName.libraryScreen,
        builder: (context, state) => LibraryScreen(),
      ),
      GoRoute(
        path: RoutesName.navigationRoot,
        builder: (context, state) => NavigationRoot(),
      ),    GoRoute(
        path: RoutesName.loginScreen,
        builder: (context, state) => LoginScreen(),
      ),




    ],
  );
}
