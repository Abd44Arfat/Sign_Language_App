import 'package:hive_flutter/hive_flutter.dart';
part 'dictionary_entity.g.dart';

@HiveType(typeId: 0)
class DictionaryEntity {
  @HiveField(0)
  final String Link;
  @HiveField(1)
  final String mainTitle;

  DictionaryEntity({required this.Link, required this.mainTitle});
}
