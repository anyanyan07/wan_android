import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  static const FIRST_LAUNCH = 'FIRST_LAUNCH';
  static const USER_INFO = 'USER_INFO';
  static const TOKEN = 'TOKEN';

  static Future<bool> isFirstLaunch() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool firstLaunch = prefs.getBool(FIRST_LAUNCH);
      return firstLaunch??true;
    } catch (e) {
      print(e);
    }
    return true;
  }

  static setFirstLaunch(bool firstLaunch) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool(FIRST_LAUNCH, firstLaunch);
    } catch (e) {
      print(e);
    }
  }

  static Future<bool> hadLogin() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String userInfo = prefs.getString(USER_INFO);
      if (userInfo.isEmpty) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  static saveLoginInfo(String userInfo,String token) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(USER_INFO, userInfo);
    prefs.setString(TOKEN, token);
  }

  static Future<Map<String,String>> getLoginInfo() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String,String> map = {
      "token":prefs.getString(TOKEN),
      "userInfo":prefs.getString(USER_INFO)
    };
    return map;
  }

  static Future<String> getToken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(TOKEN);
  }
}
