
import 'package:dartz/dartz.dart';
import 'package:interview_task/api_calling/data/datamodel/api_model.dart';
import 'package:interview_task/api_calling/data/datasource/api_datasource.dart';
import 'package:interview_task/api_calling/domain/repository/api_repository.dart';
import 'package:interview_task/constants/status_objects.dart';
class ApiRepositoryImpl extends ApiRepository {
  ApiDataSource apiDataSource;

  ApiRepositoryImpl({this.apiDataSource});

  @override
  Future<Either<Failure, ApiResponseModel>> getApiData() async {
    final result = await apiDataSource.getApiData();
    return Right(result);
  }
}
