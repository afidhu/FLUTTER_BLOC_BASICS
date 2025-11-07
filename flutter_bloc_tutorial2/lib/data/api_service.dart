import 'package:dio/dio.dart';

import 'models.dart';
class ApiServices{

  final dio = Dio(BaseOptions(
    baseUrl: 'http://192.168.1.133:5000',
    connectTimeout: Duration(seconds: 5),
    receiveTimeout: Duration(seconds: 3),
  ));


  Future<Response> fetchPtoduct() async{
    try{
      return  await dio.get('/product');
    }catch(e){
      print(e.toString());
      throw Exception('Something went wrong : ${e.toString()}');
    }
  }


  Future<Response> addToCart(cartModel) async{
    try{
      return  await dio.post('/carts', data: cartModel.toJson());
    }catch(e){
      print(e.toString());
      throw Exception('Something went wrong : ${e.toString()}');
    }
  }



  Future<Response> cartCounts() async{
    try{
      return  await dio.get('/carts/count',);
    }catch(e){
      print(e.toString());
      throw Exception('Something went wrong : ${e.toString()}');
    }
  }


  }
