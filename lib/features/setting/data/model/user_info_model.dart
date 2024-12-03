import 'package:sign_lang_app/features/setting/domain/entity/edit_info_entity.dart';

class UserInfo extends EditInformationEntity {
  String id;
  @override
  String name;
  @override
  String email;
  String password;
  bool confirmEmail;
  String role;
  UserInfo(
      {required this.name,
      required this.email,
      required this.password,
      required this.id,
      required this.confirmEmail,
      required this.role})
      : super(email: email, name: name);

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
        //name: json["name"]  == null ? null : json["name"] as String,
        name: json["name"] as String,
        email: json["email"] as String,
        password: json["password"] as String,
        id: json["_id"] as String,
        confirmEmail: json["confirmEmail"] as bool,
        role: json["role"] as String);
  }

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "_id": id,
        "confirmEmail": confirmEmail,
        "role": role
      };
}
