import 'package:dio/dio.dart';

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

Future<List<ProductModel>> fetchProduct() async{
  try{
    final response = await dio.get('/products');
    if(response.statusCode == 200) {
      List<dynamic> dataList = response.data;
      List<ProductModel> productList = dataList.map((json) =>
          ProductModel.fromJson(json)).toList();
      return productList;
    }
    else{
      throw Exception('Failed to load data');
    }
  } catch(e){
    throw Exception('Error: $e');
  }
}

}
