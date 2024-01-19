class ApiConstance {
  static const String baseURL = "http://nestdev99-001-site2.atempurl.com/api/";

  //Users
  static String checkLogInPath(String name) =>
      "${baseURL}Users/CheckLogin?Name=$name";
  static String updateUser = "${baseURL}Users/UpdateUser";

  //Company
  static String allCompanyTypePath = "${baseURL}Company/GetAllCompanyType";
  static String getCompanyTypeByIdPath(int compId) =>
      "${baseURL}Company/GetCompanyTypeById/$compId";

  //Category
  static String allCategoryPath = "${baseURL}Category/GetAllCategory";

  //Waste
  static String getWasteByCategoryPath(int catId) =>
      "${baseURL}Waste/GetWasteByCategory/$catId";

  //Basket
  static String addBasketPath = "${baseURL}Basket/AddBasket";

  static String getDataBasketPath(int uID) =>
      "${baseURL}Basket/GetDataBasket/$uID";

  static String updateQuantityOrAddPath =
      "${baseURL}Quantity/UpdateQuantityOrAdd";

  static String deleteBasketByWestPath(int uID, int wastRef) =>
      "${baseURL}Basket/DeleteBasketByWest/$wastRef/$uID";

  //Address
  static String addAddressPath = "${baseURL}Address/AddAddress";
  static String checkUserAddressPath(int uID) =>
      "${baseURL}Address/GetAddressByUid/$uID";
  static String updateAddressPath = "${baseURL}Address/UpdateAddress";
}
