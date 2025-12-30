

import 'package:bloc_clean_architecture/core/utils/network/dio_client.dart';
import 'package:dio/dio.dart';

class ProductDataSource{

// final dioClient =DioClient();
  Future<Response> getPosts() async{
    try{
      return await DioClient().dio.get('/products');
    } catch(e){
      rethrow;
    }

  }



}