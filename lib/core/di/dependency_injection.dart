
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sign_lang_app/core/utils/api_service.dart';
import 'package:sign_lang_app/features/dictionary/data/data_source/local_data_source.dart';
import 'package:sign_lang_app/features/dictionary/data/data_source/remote_data_source.dart';
import 'package:sign_lang_app/features/dictionary/data/dictionary_repo_impl.dart';

final getIt= GetIt.instance;

void setupServiceLocator() {
getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
getIt.registerSingleton<DictionaryRepoImpl>(DictionaryRepoImpl(

  dictionaryLocalDataSource:DictionaryLocalDataSourceImpl(),
   dictionaryRemoteDataSource: DictionaryRemoteDataSourceImpl(
     apiService: getIt.get<ApiService>(),) ));



}
