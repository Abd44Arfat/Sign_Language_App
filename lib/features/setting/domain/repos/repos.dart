

import 'package:dartz/dartz.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/features/setting/data/models/edit_info_request.dart';
import 'package:sign_lang_app/features/setting/data/models/edit_info_response.dart';

abstract class EditInfoRepo {

  Future<Either<Failure, EditInfoResponse>> editInfo(EditInfoReqParams params);



}