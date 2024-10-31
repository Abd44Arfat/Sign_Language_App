
class EditInfoReqParams {
final String name;
final String email;

  EditInfoReqParams({required this.name, required this.email});


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
    };
  }

}
