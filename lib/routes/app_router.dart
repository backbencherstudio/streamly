import 'package:go_router/go_router.dart';
import 'package:streamly/routes/routes.dart';
import 'package:streamly/view/library/screen/library_screen.dart';
import 'package:streamly/view/live/screen/LiveViewScreen.dart';
import 'package:streamly/view/video_play/screen/video_play_screen.dart';
import '../view/auth/forgot_password/forgot_password_screen.dart';
import '../view/auth/forgot_password/reset_success_screen.dart';
import '../view/auth/forgot_password/set_new_password_screen.dart';
import '../view/auth/forgot_password/verify_code_screen.dart';
import '../view/auth/login/login_screen.dart';
import '../view/auth/sign_up/sign_up_screen.dart';
import '../view/home/components/content_details/content_detail_screen.dart';
import '../view/navigation/navigation_root.dart';
import '../view/profile/componenst/add_new_card/add_new_card_screen.dart';
import '../view/profile/componenst/download/download_screen.dart';
import '../view/profile/componenst/help_support/help_support_screen.dart';
import '../view/profile/componenst/manage_plan/mangage_plane_screen.dart';
import '../view/profile/componenst/notification/notification_screen.dart';
import '../view/profile/componenst/payment_method/payment_method_screen.dart';
import '../view/profile/componenst/setting/setting_screen.dart';
import '../view/profile/componenst/storage_managment/storage_management_screen.dart';
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
      GoRoute(
        path: RoutesName.signUpScreen,
        builder: (context, state) => SignUpScreen(),
      ),
      GoRoute(
        path: RoutesName.forgotPasswordScreen,
        builder: (context, state) => ForgotPasswordScreen(),
      ),

      GoRoute(
        path: RoutesName.verifyCodeScreen,
        builder: (context, state) => VerifyCodeScreen(),
      ),
      GoRoute(
        path: RoutesName.setNewPasswordScreen,
        builder: (context, state) => SetNewPasswordScreen(),
      ),
      GoRoute(
        path: RoutesName.resetSuccessSScreen,
        builder: (context, state) => ResetSuccessScreen(),
      ),
      GoRoute(
        path: RoutesName.downloadScreen,
        builder: (context, state) => DownloadScreen(),
      ),
      GoRoute(
        path: RoutesName.storageManagementScreen,
        builder: (context, state) => StorageManagementScreen(),
      ),
      GoRoute(
        path: RoutesName.contentDetailScreen,
        builder: (context, state) => ContentDetailScreen(),
      ),
      GoRoute(
        path: RoutesName.videoPlayScreen,
        builder: (context, state) => VideoPlayScreen(isEpisode: true),
      ),
    ],
  );
}
