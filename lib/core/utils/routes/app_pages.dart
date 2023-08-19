import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tadwer_app/auth/presentation/screens/log_in_screen.dart';
import 'package:tadwer_app/users/presentation/controller/date_controller.dart';
import 'package:tadwer_app/users/presentation/controller/waste_types_controller.dart';
import 'package:tadwer_app/users/presentation/screens/facility_type_screen.dart';
import 'package:tadwer_app/users/presentation/screens/order_confirmation_screen.dart';
import 'package:tadwer_app/users/presentation/screens/waste_types_screen.dart';

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
    GetPage(
      name: Paths.facilityType,
      page: () => const FacilityTypeScreen(),
      transitionDuration: const Duration(milliseconds: 300),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: Paths.wasteType,
      page: () => ChangeNotifierProvider(
          create: (_) => WasteTypeProvider(),
          builder: (context, child) {
            return const WasteTypesScreen();
          }),
      transitionDuration: const Duration(milliseconds: 300),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: Paths.orderConfirmation,
      page: () => MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => DateController())],
          builder: (context, child) {
            return const OrderConfirmationScreen();
          }),
      transitionDuration: const Duration(milliseconds: 300),
      transition: Transition.downToUp,
    ),
  ];
}
