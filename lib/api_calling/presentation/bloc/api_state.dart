
import 'package:interview_task/api_calling/data/datamodel/api_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ApiState {}

class InitialApiState extends ApiState {}

class LoadingBeginApiState extends ApiState {}

class LoadingEndApiState extends ApiState {}

class ErrorState extends ApiState {
  final String message;

  ErrorState(this.message);
}

class GetApiState extends ApiState {
  ApiResponseModel apiResponseModel;

  GetApiState({this.apiResponseModel});
}