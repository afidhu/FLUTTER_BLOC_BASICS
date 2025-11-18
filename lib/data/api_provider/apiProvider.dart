import 'package:dio/dio.dart';
import 'package:get/utils.dart';

import '../model/product_model.dart';

class ApiService {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://fakestoreapi.com',
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 3),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  /////////////////Fetch data from API

  // Future<List<ProductModel>> fetchProduct() async{
  //   try{
  //     final response = await dio.get('/products');
  //     if(response.statusCode == 200) {
  //       List<dynamic> dataList = response.data;
  //       List<ProductModel> productList = dataList.map((json) =>
  //           ProductModel.fromJson(json)).toList();
  //       return productList;
  //     }
  //     else{
  //       throw Exception('Failed to load data');
  //     }
  //   } catch(e){
  //     print('ErrorAt: ${e}');
  //     throw Exception('Error: $e');
  //   }
  // }

  ///////////////THis is Error Handling
  Future<List<ProductModel>> fetchProduct() async {
    try {
      final response = await dio.get('/products');

      if (response.statusCode == 200) {
        List<dynamic> dataList = response.data;
        List<ProductModel> productList = dataList
            .map((json) => ProductModel.fromJson(json))
            .toList();
        return productList;
      } else {
        throw 'Failed to load data from server';
      }
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          throw 'Connection timeout. Please try again.';
        case DioExceptionType.receiveTimeout:
          throw 'Server took too long to respond.';
        case DioExceptionType.badResponse:
          throw 'Server error:\n ${e.response?.statusCode} Not found';
        case DioExceptionType.unknown:
          throw 'No internet connection or network error.';
        case DioExceptionType.sendTimeout:
          throw 'Request timed out. Please try again.';
        case DioExceptionType.badCertificate:
          throw 'Bad certificate. Please try again.';
        case DioExceptionType.connectionError:
          throw 'Connection error. Please check your internet connection.';
        default:
          throw 'Unexpected error occurred.';
      }
    } catch (e) {
      throw 'Internal server Error: $e';
    }
  }
}
