
class SignupReqParams {
  final String name;
  final String email;
  final String password;
  final String repassword;

  SignupReqParams(
      {required this.name,
      required this.email,
      required this.password,
      required this.repassword});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'repassword': repassword,
    };
  }



}
