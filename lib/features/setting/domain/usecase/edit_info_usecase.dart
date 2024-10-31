import 'package:dartz/dartz.dart';
import 'package:sign_lang_app/core/di/dependency_injection.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/features/setting/data/model/user_info_model.dart';

import 'package:sign_lang_app/features/setting/domain/entity/edit_info_entity.dart';
import 'package:sign_lang_app/features/setting/domain/repo/edit_info_repo.dart';

import '../../../../core/usecase/usecase.dart';


class EditInfoUseCase extends UseCase<UserInfo, EditInformationEntity> {
  //final EditInformationRepo repo ;
  //EditInfoUseCase({required this.repo});
  @override
  Future<Either<Failure , UserInfo>> call([EditInformationEntity? entity]) async {
    return await getIt<EditInformationRepo>().updateUserInfo(entity!);
  }

}