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

  static String addBasketPath = "${baseURL}Basket/AddBasket";
}
