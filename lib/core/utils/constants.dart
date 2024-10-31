const KDictionaryBox = 'dictionaryBox';



class ApiUrls {
static const baseURL="http://127.0.0.1:3000";

static const register= "${baseURL}/auth/signup";
static const login= "${baseURL}/auth/signin";
static const dictionary= "${baseURL}/dectionary";

}


bool isLoggedInUser = false ;

class SharedPrefKeys {
  static const String userToken = 'userToken';
}