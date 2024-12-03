import 'package:dartz/dartz.dart';
import 'package:sign_lang_app/core/di/dependency_injection.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/features/setting/data/data_source/remote_data_source/edit_info_remote_data_source.dart';
import 'package:sign_lang_app/features/setting/data/model/user_info_model.dart';
import 'package:sign_lang_app/features/setting/domain/entity/edit_info_entity.dart';
import 'package:sign_lang_app/features/setting/domain/repo/edit_info_repo.dart';

class EditInfoRepoImpl implements EditInformationRepo {
  final EditInfoRemoteDataSource remoteDataSource;
  EditInfoRepoImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, UserInfo>> updateUserInfo(
      EditInformationEntity entity) async {
    return getIt<EditInfoRemoteDataSource>().saveUserInfo(entity);
  }
}
