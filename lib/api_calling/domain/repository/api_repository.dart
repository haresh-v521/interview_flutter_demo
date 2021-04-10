
import 'package:dartz/dartz.dart';
import 'package:interview_task/api_calling/data/datamodel/api_model.dart';
import 'package:interview_task/constants/status_objects.dart';

abstract class ApiRepository {

  Future<Either<Failure, ApiResponseModel>> getApiData();
}
