import 'dectionary.dart';

class DictionaryModel {
  String? message;
  List<Dectionary>? dectionaries;

  DictionaryModel({this.message, this.dectionaries});

  factory DictionaryModel.fromJson(Map<String, dynamic> json) {
    return DictionaryModel(
      message: json['message'] as String?,
      dectionaries: (json['dectionaries'] as List<dynamic>?)
          ?.map((e) => Dectionary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'dectionaries': dectionaries?.map((e) => e.toJson()).toList(),
      };
}
