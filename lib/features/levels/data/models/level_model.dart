class LevelsModel {
  final String message;
  final List<LevelModel> levelModel;

  LevelsModel({required this.message, required this.levelModel});

  factory LevelsModel.fromJson(Map<String, dynamic> map) {
    var levelsFromJson = map['levels'] as List;
    List<LevelModel> levelList =
        levelsFromJson.map((i) => LevelModel.fromJson(i)).toList();
    return LevelsModel(message: map['message'], levelModel: levelList);
  }
}

class LevelModel {
  final String name, id, categoryId;
  LevelModel({required this.categoryId, required this.id, required this.name});

  factory LevelModel.fromJson(Map<String, dynamic> map) {
    return LevelModel(
        categoryId: map['category'], id: map['id'], name: map['name']);
  }
}
