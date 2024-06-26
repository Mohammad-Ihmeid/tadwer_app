import 'package:tadwer_app/auth/presentation/screens/log_in_screen.dart';
import 'package:tadwer_app/auth/presentation/screens/sign_up_screes.dart';
import 'package:tadwer_app/auth/presentation/screens/user_info_screen.dart';
import 'package:tadwer_app/company/presentation/screens/basket_screen.dart';
import 'package:tadwer_app/company/presentation/screens/category_screen.dart';
import 'package:tadwer_app/company/presentation/screens/company_type_screen.dart';
import 'package:tadwer_app/company/presentation/screens/recycling_request_screen.dart';

import '../../../auth/presentation/screens/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = {
    Routes.splash: (context) => const SplashScreen(),
    Routes.logIn: (context) => LogInScreen(),
    Routes.companyType: (context) => const CompanyTypeScreen(),
    Routes.categoryType: (context) => const CategoryScreen(),
    Routes.basket: (context) => const BasketScreen(),
    Routes.recyclingRequest: (context) => const RecyclingRequestScreen(),
    Routes.userInfo: (context) => const UserInfoScreen(),
    Routes.signUp: (context) => const SignUp(),
  };
}
