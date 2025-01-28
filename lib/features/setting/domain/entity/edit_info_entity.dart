class EditInformationEntity {
  final String name;
  final String email;
  EditInformationEntity({ required this.email,  required this.name});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'name': name,
    };
  }

}
