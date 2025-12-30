


import 'package:bloc_clean_architecture/core/utils/app_constants/api_constant.dart';
import 'package:dio/dio.dart';

class DioClient{



  final dio = Dio(BaseOptions(
    baseUrl:ApiConstant.baseUrl,
    connectTimeout: Duration(seconds: 5),
    receiveTimeout: Duration(seconds: 3),
  ) );
}