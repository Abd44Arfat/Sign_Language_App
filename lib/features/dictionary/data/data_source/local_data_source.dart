import 'package:hive_flutter/hive_flutter.dart';
import 'package:sign_lang_app/core/utils/constants.dart';
import 'package:sign_lang_app/features/dictionary/domain/entities/dictionary_entity.dart';

abstract class DictionaryLocalDataSource {
  List<DictionaryEntity> fetchDictionaryList();
}

class DictionaryLocalDataSourceImpl implements DictionaryLocalDataSource {
  @override
  List<DictionaryEntity> fetchDictionaryList() {
    var box = Hive.box<DictionaryEntity>(KDictionaryBox);
    return box.values.toList();
  }
}
