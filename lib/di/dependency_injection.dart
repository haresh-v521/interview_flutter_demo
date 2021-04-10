

import 'package:get_it/get_it.dart';
import 'package:interview_task/api_calling/data/datasource/api_datasource.dart';
import 'package:interview_task/api_calling/data/datasource/api_datasource_impl.dart';
import 'package:interview_task/api_calling/data/repository/api_repository_impl.dart';
import 'package:interview_task/api_calling/domain/repository/api_repository.dart';
import 'package:interview_task/api_calling/domain/usecase/api_usecase.dart';
import 'package:interview_task/api_calling/presentation/bloc/api_bloc.dart';

final getIt = GetIt.instance;

Future<void> initGetServiceLocator() async {

  ///LOGIN PAGE
  //Bloc
  getIt.registerFactory(() => ApiBloc(apiUseCase: getIt()));
  //Use case
  getIt.registerFactory(() => ApiUseCase(apiRepository: getIt()));
  //DataSource
  getIt.registerLazySingleton<ApiDataSource>(() => ApiDataSourceImpl());
  //Repository
  getIt.registerLazySingleton<ApiRepository>(() => ApiRepositoryImpl(apiDataSource: getIt()));


}
