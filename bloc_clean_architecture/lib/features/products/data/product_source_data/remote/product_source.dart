
import 'package:dio/dio.dart';

import '../../../../../core/utils/network/dio_client.dart';

class ProductsRemoteSourceData{

  Future<Response> getProducts() async{
    try{
      return await  DioClient().dio.get('/products');
    } catch(e){
      rethrow;
    }
  }
}