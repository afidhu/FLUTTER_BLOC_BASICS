

import 'api_service.dart';
import 'models.dart';

class ProductRepository{
 final ApiServices apiServices;
  ProductRepository(this.apiServices);

  Future<List<ProductModle>> getData() async{
    try{
      final response = await apiServices.fetchPtoduct();
      if(response.statusCode ==200){
        List<dynamic> dataJjson = response.data;
        List<ProductModle> productList = dataJjson.map((json)=>ProductModle.fromJson(json)).toList();
        return productList;
      }
    } catch(e){
      print(e.toString());
      throw Exception('Failed to fetch data: ${e.toString()}');
    }
    return [];
  }

  Future<bool> postToCart(CartModel cartModel) async{
    try{
    final response = await apiServices.addToCart(cartModel);

    if(response.statusCode == 201){
      return true;
    }
    else {
      return false;
    }

  } catch(e){
 print(e.toString());
 throw Exception('Failed to fetch data: ${e.toString()}');
 }
  }



  Future<CartCountModel> getCartCountData() async{
    try{
    final response = await apiServices.cartCounts();

    if(response.statusCode == 200){

      return CartCountModel.fromJson(response.data);
    }
    else {
      throw Exception('Failed to fetch data');
    }

  } catch(e){
 print(e.toString());
 throw Exception('Internal Error: ${e.toString()}');
 }
  }


}