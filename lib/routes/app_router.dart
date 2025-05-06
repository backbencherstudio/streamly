import 'package:go_router/go_router.dart';
import 'package:streamly/routes/routes.dart';

import '../view/splash_screen/splash_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: RoutesName.splashScreen,
    routes: [
      GoRoute(
        path: RoutesName.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      // GoRoute(
      //   path: RoutesName.onboardingScreen,
      //   builder: (context, state) => const OnboardingScreen(),
      // ),


    ],
  );
}
