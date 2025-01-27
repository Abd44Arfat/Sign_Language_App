import 'package:shared_preferences/shared_preferences.dart';

const KDictionaryBox = 'dictionaryBox';
const KSavedwordsBox = 'SavedwordsBox';

class ApiUrls {
  //static const baseURL = "http://10.0.2.2:3000";
  static const baseURL = 'http://127.0.0.1:3000';

  static const register = "$baseURL/api/auth/signup";
  static const login = "$baseURL/api/auth/signin";
  static const dictionary = "$baseURL/api/dectionary";
  static const questions = "$baseURL/api/level";
  static const questions2 = "$baseURL/api/level/67599f435beef41c2da40fb1";
  static const EditInfo = "$baseURL/user/67238199dbb8f29faf211d6a";

  static const category = "$baseURL/api/category";

  static const levels = "$baseURL/api/level";
  static const changePass = '$baseURL/api/auth/changepassword';

  static Future<String> getEditInfoUrl() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString(SharedPrefKeys.userid);
    if (userId != null) {
      return '$baseURL/api/user/$userId';
    } else {
      return '$baseURL/api/user/dummy_id';
    }
  }
}

bool isLoggedInUser = false;

class SharedPrefKeys {
  static const String userToken = 'userToken';
  static const String onboardingCompleted = 'onboardingCompleted';
  static const String username = 'username';
  static const String userEmail = 'userEmail';
  static const String userid = 'id';
  static const String weclometestcomplete = 'weclometestcomplete';
}
