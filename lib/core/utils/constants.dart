const KDictionaryBox = 'dictionaryBox';


class ApiUrls{


static const baseURL="http://10.0.2.2:3000";
static const register= "${baseURL}/auth/signup";
static const dictionary= "${baseURL}/dectionary";


}


bool isLoggedInUser = false;

class SharedPrefKeys {
  static const String userToken = 'userToken';
}