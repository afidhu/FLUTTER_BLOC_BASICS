

import 'package:dio/dio.dart';
import 'package:flutter_bloc_tutorial3/constants/api_constants.dart';

class DioClient{
    final dio = Dio(BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 3),
    ));

}