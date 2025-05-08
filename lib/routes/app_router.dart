import 'package:go_router/go_router.dart';
import 'package:streamly/routes/routes.dart';
import 'package:streamly/view/library/screen/library_screen.dart';
import 'package:streamly/view/live/screen/LiveViewScreen.dart';
import '../view/auth/login/login_screen.dart';
import '../view/navigation/navigation_root.dart';
import '../view/profile/componenst/add_new_card/add_new_card_screen.dart';
import '../view/profile/componenst/help_support/help_support_screen.dart';
import '../view/profile/componenst/manage_plan/mangage_plane_screen.dart';
import '../view/profile/componenst/notification/notification_screen.dart';
import '../view/profile/componenst/payment_method/payment_method_screen.dart';
import '../view/profile/componenst/setting/setting_screen.dart';
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
      ),
      GoRoute(
        path: RoutesName.loginScreen,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: RoutesName.managePlaneScreen,
        builder: (context, state) => ManagePlaneScreen(),
      ),
      GoRoute(
        path: RoutesName.settingScreen,
        builder: (context, state) => SettingScreen(),
      ),
      GoRoute(
        path: RoutesName.notificationScreen,
        builder: (context, state) => NotificationScreen(),
      ),
      GoRoute(
        path: RoutesName.helpSupportScreen,
        builder: (context, state) => HelpSupportScreen(),
      ),
      GoRoute(
        path: RoutesName.paymentMethodScreen,
        builder: (context, state) => PaymentMethodScreen(),
      ),
      GoRoute(
        path: RoutesName.addNewCardScreen,
        builder: (context, state) => AddNewCardScreen(),
      ),
      GoRoute(
        path: RoutesName.liveViewScreen,
        builder: (context, state) => LiveViewScreen(),
      ),
    ],
  );
}
