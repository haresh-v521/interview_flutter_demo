
import 'package:dartz/dartz.dart';
import 'package:interview_task/constants/status_objects.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
