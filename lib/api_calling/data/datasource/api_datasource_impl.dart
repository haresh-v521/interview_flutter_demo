
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:interview_task/api_calling/data/datamodel/api_model.dart';
import 'package:interview_task/network/api_provider.dart';
import 'package:interview_task/network/api_strings.dart';

import 'api_datasource.dart';

class ApiDataSourceImpl extends ApiDataSource {
  ApiResponseModel data;
  Dio _dio = Dio(baseOption(url: baseUrl()));
  @override
  Future<ApiResponseModel> getApiData({bool isApi=true}) async {
    // Api Auth ------- Start
    try {
      Response response;
      response = await _dio.get(apiList);
      log("TestLOG :::::::::: RESPONSE ---> ${response.data}");
      data = ApiResponseModel.fromJson(response.data);

    } on DioError catch (e) {
      print("------------------------------> $e");
      data = ApiResponseModel();
    }
    // Api Auth ------- End
    return data;
  }

}
