import 'end_poinst.dart';

class AppConstatns {
  static const String baseUrl = "https://dummyjson.com";
  // static const String getUsers = "$baseUrl${EndPoints.getUsers}limit=10";
  static String getUsers(int limit) =>
      "$baseUrl${EndPoints.getUsers}limit=$limit";
}
