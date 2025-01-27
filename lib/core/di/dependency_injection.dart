import 'package:get_it/get_it.dart';
import 'package:sign_lang_app/core/utils/api_service.dart';
import 'package:sign_lang_app/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:sign_lang_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:sign_lang_app/features/auth/domain/repos/auth_repo.dart';
import 'package:sign_lang_app/features/auth/domain/usecases/signin_usecase.dart';
import 'package:sign_lang_app/features/auth/domain/usecases/signup_usecase.dart';
import 'package:sign_lang_app/features/categories/data/data_sourece/remote_data_source.dart';
import 'package:sign_lang_app/features/categories/data/repo/repo_impl.dart';
import 'package:sign_lang_app/features/categories/domain/repo/repo.dart';
import 'package:sign_lang_app/features/categories/domain/usecase/fetch_categories_usecase.dart';
import 'package:sign_lang_app/features/change_password/data/data_source/remote_data_source/change_password_remote_data_source.dart';
import 'package:sign_lang_app/features/change_password/data/repo/change_password_repo_impl.dart';
import 'package:sign_lang_app/features/change_password/domain/repo/change_password_repo.dart';
import 'package:sign_lang_app/features/change_password/domain/use_case/change_password_usecase.dart';
import 'package:sign_lang_app/features/dictionary/data/data_source/local_data_source.dart';
import 'package:sign_lang_app/features/dictionary/data/data_source/remote_data_source.dart';
import 'package:sign_lang_app/features/dictionary/data/dictionary_repo_impl.dart';
import 'package:sign_lang_app/features/learn/data/data_source/learn_remote_datasource.dart';
import 'package:sign_lang_app/features/learn/data/repo/repo_impl.dart';
import 'package:sign_lang_app/features/learn/domain/repo/question_repo.dart';
import 'package:sign_lang_app/features/learn/domain/usecase/fetch_question_usecase.dart';
import 'package:sign_lang_app/features/learn/domain/usecase/sign_before_quiz_usecase.dart';
import 'package:sign_lang_app/features/levels/data/data_source/remote_data_source.dart';
import 'package:sign_lang_app/features/levels/data/repo/repo_impl.dart';
import 'package:sign_lang_app/features/levels/domain/repo/repo.dart';
import 'package:sign_lang_app/features/levels/domain/usecase/fetch_levels_usecase.dart';
import 'package:sign_lang_app/features/levels/presentation/manager/levels_cubit.dart';
import 'package:sign_lang_app/features/setting/data/datasource/remote_data_source.dart';
import 'package:sign_lang_app/features/setting/data/repo_impl/repo_impl.dart';
import 'package:sign_lang_app/features/setting/domain/repos/repos.dart';
import 'package:sign_lang_app/features/setting/domain/usecases/edit_info_usecase.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<DioClient>(
    DioClient(),
  );

  getIt.registerSingleton<AuthRemoteDataSource>(AuthRemoteDataSourceImpl());

  getIt.registerSingleton<EditRemoteDataSource>(EditRemoteDataSourceImpl());

  getIt.registerSingleton<CategoriesRemoteDataSource>(
      CategoriesRemoteDataSourceImpl(dioClient: getIt.get<DioClient>()));

  getIt.registerSingleton<AuthRepo>(AuthRepoImpl());

  getIt.registerSingleton<CategoryRepo>(CategoriesRepoImpl());

//getIt.registerSingleton<EditRemoteDataSource>(EditRemoteDataSourceImpl());

  getIt.registerSingleton<EditInfoRepo>(EditInfoRepoImpl());

  getIt.registerSingleton<SignupUsecase>(SignupUsecase());

  getIt.registerSingleton<SignInUsecase>(SignInUsecase());
//learn
  getIt.registerSingleton<LearnRepo>(LearnRepoImpl());
  getIt.registerSingleton<LearnRemoteDataSource>(
      LearnRemoteDataSourceImpl(dioClient: getIt.get<DioClient>()));
  getIt.registerSingleton<FetchQuestionListUsecase>(
      FetchQuestionListUsecase(learnRepo: getIt.get<LearnRepo>()));
//sign before test
  getIt.registerSingleton<AvatarBeforeQuizUsecase>(
      AvatarBeforeQuizUsecase(learnRepo: getIt.get<LearnRepo>()));

  getIt.registerSingleton<FetchCategoriesListUsecase>(
      FetchCategoriesListUsecase(categoryRepo: getIt.get<CategoryRepo>()));

  getIt.registerSingleton<EditInfoUsecase>(EditInfoUsecase());

  getIt.registerSingleton<DictionaryRepoImpl>(
    DictionaryRepoImpl(
      dictionaryLocalDataSource: DictionaryLocalDataSourceImpl(),
      dictionaryRemoteDataSource: DictionaryRemoteDataSourceImpl(
        dioClient: getIt.get<DioClient>(),
      ),
    ),
  );

  getIt.registerSingleton<LevelsRemoteDataSource>(
      RemoteDataSourceImpl(dio: getIt.get<DioClient>()));
  getIt.registerSingleton<LevelsRepo>(LevelsRepoImpl());

  getIt.registerSingleton<FetchLevelsUsecase>(
      FetchLevelsUsecase(levelsRepo: getIt.get<LevelsRepo>()));
  getIt.registerSingleton<LevelsCubit>(
    LevelsCubit(getIt<FetchLevelsUsecase>()),
  );

  getIt.registerSingleton<ChangePasswordRepo>(ChangePasswordRepoImpl());

  getIt.registerSingleton<ChangePasswordRemoteDataSource>(
      ChangePasswordRemoteDataSourceImpl());

  getIt.registerSingleton<ChangePasswordUsecase>(ChangePasswordUsecase());
}
