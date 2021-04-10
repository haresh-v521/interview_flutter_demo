
import 'package:interview_task/api_calling/data/datamodel/api_model.dart';

abstract class ApiDataSource {
  Future<ApiResponseModel> getApiData();
}
