abstract class Routes {
  Routes._();

  static const splash = Paths.splash;
  static const logIn = Paths.logIn;
  static const facilityType = Paths.facilityType;
  static const wasteType = Paths.wasteType;
  static const orderConfirmation = Paths.orderConfirmation;
  static const locationUsers = Paths.locationUsers;
}

abstract class Paths {
  //Auth
  static const splash = '/splash';
  static const logIn = '/logIn';
  //Users
  static const facilityType = '/facilityType';
  static const wasteType = '/wasteType';
  static const orderConfirmation = '/orderConfirmation';
  static const locationUsers = '/locationUsers';
}
