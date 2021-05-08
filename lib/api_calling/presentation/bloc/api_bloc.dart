import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_task/api_calling/domain/usecase/api_usecase.dart';
import 'package:interview_task/api_calling/presentation/bloc/api_event.dart';

import 'api_state.dart';


class ApiBloc extends Bloc<ApiEvent, ApiState> {

  ApiUseCase apiUseCase;

  ApiBloc(
      {this.apiUseCase})
      : super(InitialApiState());

  @override
  Stream<ApiState> mapEventToState(ApiEvent event) async* {
    //All Events manage here...
    if (event is GetApiEvent) {
      yield LoadingBeginApiState();
      final result = await apiUseCase(NoParams());
      yield LoadingEndApiState();
      yield result.fold(
            (error) => ErrorState(error.message),
            (success) => GetApiState(apiResponseModel: success),
      );
    }
    if (event is SingleCheckEvent) {
      yield SingleCheckState(isCheck: event.isCheck);
    }
  }
}
