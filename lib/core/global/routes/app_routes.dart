abstract class Routes {
  Routes._();

  static const splash = Paths.splash;
  static const logIn = Paths.logIn;
  static const companyType = Paths.companyType;
  static const categoryType = Paths.categoryType;

  static const wasteType = Paths.wasteType;
  static const orderConfirmation = Paths.orderConfirmation;
}

abstract class Paths {
  //Auth
  static const splash = '/splash';
  static const logIn = '/logIn';
  //Users
  static const companyType = '/companyType';
  static const categoryType = '/categoryType';

  static const facilityType = '/facilityType';
  static const wasteType = '/wasteType';
  static const orderConfirmation = '/orderConfirmation';
}
