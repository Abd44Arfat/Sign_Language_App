class Dectionary {
  String? id;
  String? videoUrl;
  String? title;

  Dectionary({this.id, this.videoUrl, this.title});

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
