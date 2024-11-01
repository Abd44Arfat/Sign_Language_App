


import 'package:dartz/dartz.dart';
import 'package:sign_lang_app/core/di/dependency_injection.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/core/usecase/usecase.dart';
import 'package:sign_lang_app/features/setting/data/models/edit_info_request.dart';
import 'package:sign_lang_app/features/setting/data/models/edit_info_response.dart';
import 'package:sign_lang_app/features/setting/domain/repos/repos.dart';

class EditInfoUsecase implements UseCase<EditInfoResponse,EditInfoReqParams> {
  @override
  Future<Either<Failure, EditInfoResponse>> call([EditInfoReqParams? param])async {
return await getIt<EditInfoRepo>().editInfo(param!);



  }
}