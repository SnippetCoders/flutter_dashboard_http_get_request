import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'model/login_model.dart';

class SharedService {
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString("login_details") != null ? true : false;
  }

  static Future<void> setLoginDetails(LoginResponseModel loginResponse) async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.setString("login_details",
        loginResponse != null ? jsonEncode(loginResponse.toJson()) : null);
  }

  static Future<void> logout() async {
    await setLoginDetails(null);
  }

  // static Future<Login> loginDetails() async {
  //   final prefs = await SharedPreferences.getInstance();

  //   return prefs.getString("login_details") != null
  //       ? Login.fromJson(jsonDecode(prefs.getString("login_details")))
  //       : null;
  // }
}
