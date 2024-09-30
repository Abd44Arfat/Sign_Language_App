import 'package:get_it/get_it.dart';
import 'package:sign_lang_app/core/utils/api_service.dart';
import 'package:sign_lang_app/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:sign_lang_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:sign_lang_app/features/auth/domain/repos/auth_repo.dart';
import 'package:sign_lang_app/features/auth/domain/usecases/signin_usecase.dart';
import 'package:sign_lang_app/features/auth/domain/usecases/signup_usecase.dart';
import 'package:sign_lang_app/features/dictionary/data/data_source/local_data_source.dart';
import 'package:sign_lang_app/features/dictionary/data/data_source/remote_data_source.dart';
import 'package:sign_lang_app/features/dictionary/data/dictionary_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<DioClient>(
    DioClient(),
  );

getIt.registerSingleton<AuthRemoteDataSource>(AuthRemoteDataSourceImpl());


getIt.registerSingleton<AuthRepo>(AuthRepoImpl());
getIt.registerSingleton<SignupUsecase>(SignupUsecase());

getIt.registerSingleton<SignInUsecase>(SignInUsecase());



  getIt.registerSingleton<DictionaryRepoImpl>(
    DictionaryRepoImpl(
      dictionaryLocalDataSource: DictionaryLocalDataSourceImpl(),
      dictionaryRemoteDataSource: DictionaryRemoteDataSourceImpl(
        dioClient: getIt.get<DioClient>(),
      ),
    ),
  );

}
