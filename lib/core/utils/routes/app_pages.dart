import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tadwer_app/auth/presentation/screens/log_in_screen.dart';

import '../../../auth/presentation/controller/login_controller.dart';
import '../../../auth/presentation/screens/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: Paths.splash,
      page: () => const SplashScreen(),
      transitionDuration: const Duration(milliseconds: 300),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: Paths.logIn,
      page: () => ChangeNotifierProvider(
          create: (context) => LogInProvider(),
          builder: (context, child) {
            return const LogInScreen();
          }),
      transitionDuration: const Duration(milliseconds: 300),
      transition: Transition.downToUp,
    ),
  ];
}
