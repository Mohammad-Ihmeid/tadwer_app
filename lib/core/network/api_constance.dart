class ApiConstance {
  static const String baseURL = "http://nestdev99-001-site2.atempurl.com/api/";

  static String checkLogInPath(String name) =>
      "${baseURL}Users/CheckLogin?Name=$name";
}
