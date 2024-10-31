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
import 'package:sign_lang_app/features/setting/data/data_source/remote_data_source/edit_info_remote_data_source.dart';
import 'package:sign_lang_app/features/setting/data/repo_impl/edit_info_repo_iml.dart';
import 'package:sign_lang_app/features/setting/domain/repo/edit_info_repo.dart';

import '../../features/setting/domain/usecase/edit_info_usecase.dart';

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




  getIt.registerLazySingleton<EditInfoRemoteDataSource>(() => EditInfoRemoteDataSource( getIt.get<DioClient>() ));


  getIt.registerLazySingleton<EditInformationRepo>( () =>
      EditInfoRepoImpl(remoteDataSource: getIt<EditInfoRemoteDataSource>())
  );
  getIt.registerLazySingleton<EditInfoUseCase>( ()=>
    EditInfoUseCase( )
  );

}
