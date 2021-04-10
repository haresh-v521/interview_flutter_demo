import 'package:dio/dio.dart';


// BaseOptions
BaseOptions baseOption({String token, String url}) {
  return BaseOptions(
    baseUrl: url,
    connectTimeout: 10*1000, // 10 seconds
    receiveTimeout: 10*1000, // 10 seconds
    headers: <String, String>{
      "Content-Type": "application/json",
      if (token != null) "authorization": token
    },
  );
}
