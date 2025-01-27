class ChangePasswordReq {
  final String email, oldPassword, newPassword;
  ChangePasswordReq(
      {required this.email,
      required this.newPassword,
      required this.oldPassword});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "email": email,
      "oldPassword": oldPassword,
      "newPassword": newPassword
    };
  }
}


/*{
  "email":"Doha.testt@gmail.com",
  "oldPassword":"Dohatestt",
  "newPassword":"Dohatesttt"

} */