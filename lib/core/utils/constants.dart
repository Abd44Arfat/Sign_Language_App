const KDictionaryBox = 'dictionaryBox';


class ApiUrls{


static const baseURL="http://10.0.2.2:3000";
static const register= "${baseURL}/auth/signup";
static const login= "${baseURL}/auth/signin";
static const dictionary= "${baseURL}/dectionary";


}


bool isLoggedInUser = false;

class SharedPrefKeys {
  static const String userToken = 'userToken';
  static const String onboardingCompleted = 'onboardingCompleted';
    static const String username = 'username';
  static const String userEmail= 'userEmail';

}