
import 'package:bloc_clean_architecture/core/utils/network/dio_client.dart';
import 'package:dio/dio.dart';

class CartRemoteDataSource {


  Future<Response> getCartView() async{
    try{
      return await DioClient().dio.get('/carts');
    } catch(e){
      rethrow;

    }
  }


}