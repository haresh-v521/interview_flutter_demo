
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:interview_task/api_calling/data/datamodel/api_model.dart';
import 'package:interview_task/api_calling/domain/repository/api_repository.dart';
import 'package:interview_task/constants/status_objects.dart';
import 'package:interview_task/usecase/usecase.dart';


class ApiUseCase extends UseCase<ApiResponseModel, NoParams> {
  ApiRepository apiRepository;

  ApiUseCase({this.apiRepository});

  @override
  Future<Either<Failure, ApiResponseModel>> call(NoParams noParams) async {
    return await apiRepository.getApiData();
  }
}

class NoParams extends Equatable {
  NoParams();

  @override
  List<Object> get props => [];
}
