import 'package:get/get.dart';

import '../../../auth/presentation/screens/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
    GetPage(name: Paths.splash, page: () => const SplashScreen()),
  ];
}
