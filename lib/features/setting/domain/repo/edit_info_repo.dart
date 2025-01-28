import 'package:dartz/dartz.dart';
import 'package:sign_lang_app/features/setting/data/model/user_info_model.dart';
import 'package:sign_lang_app/features/setting/domain/entity/edit_info_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class EditInformationRepo{
  Future<Either< Failure , UserInfo>> updateUserInfo(EditInformationEntity entity);
}