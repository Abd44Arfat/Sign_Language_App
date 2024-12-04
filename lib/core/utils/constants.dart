import 'package:shared_preferences/shared_preferences.dart';

const KDictionaryBox = 'dictionaryBox';
const KSavedwordsBox = 'SavedwordsBox';



class ApiUrls {
static const baseURL="http://10.0.2.2:3000";

static const register= "${baseURL}/auth/signup";
static const login= "${baseURL}/auth/signin";
static const dictionary= "${baseURL}/dectionary";
static const EditInfo= "${baseURL}/user/67238199dbb8f29faf211d6a";
static const category= "${baseURL}/category";


  static Future<String> getEditInfoUrl() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString(SharedPrefKeys.userid);
    if (userId != null) {
      return '${baseURL}/user/$userId';
    } else {
     
      return '${baseURL}/user/dummy_id'; 
    }
  }


}


bool isLoggedInUser = false ;

class SharedPrefKeys {
  static const String userToken = 'userToken';
  static const String onboardingCompleted = 'onboardingCompleted';
    static const String username = 'username';
  static const String userEmail= 'userEmail';
    static const String userid= 'id';


}