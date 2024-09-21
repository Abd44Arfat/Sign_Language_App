import 'package:sign_lang_app/features/dictionary/domain/entities/dictionary_entity.dart';

class Dectionary extends DictionaryEntity{
  String? id;
  String? videoUrl;
  String? title;

  Dectionary({this.id, this.videoUrl, this.title}) : super(Link: videoUrl!, mainTitle: title!);

  factory Dectionary.fromJson(Map<String, dynamic> json) => Dectionary(
        id: json['_id'] as String?,
        videoUrl: json['videoUrl'] as String?,
        title: json['title'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'videoUrl': videoUrl,
        'title': title,
      };
}
