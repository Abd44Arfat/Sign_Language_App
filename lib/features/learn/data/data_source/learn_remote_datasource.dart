import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/core/utils/api_service.dart';
import 'package:sign_lang_app/core/utils/constants.dart';
import 'package:sign_lang_app/features/learn/data/models/question_response.dart';

abstract class LearnRemoteDataSource {
  Future<Either<Failure, List<Questions>>> fetchQuestionList();
}

class LearnRemoteDataSourceImpl extends LearnRemoteDataSource {
  @override
  final DioClient dioClient;

  LearnRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<Either<Failure, List<Questions>>> fetchQuestionList() async {
    try {
      // Fetch data from the API
      var response = await dioClient.get(ApiUrls.questions);
      
    
      List<Questions> questions = (response.data['Questions'] as List)
          .map((json) => Questions.fromJson(json))
          .toList();

      // Return the result wrapped in Right
      return Right(questions);
    } catch (e) {
      // Return the error wrapped in Left
      return Left(Failure(e.toString()));
    }
  }
  
}