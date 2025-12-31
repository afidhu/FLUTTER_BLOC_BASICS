


import 'package:bloc_clean_architecture/features/carts/domain/entities/cart_entity.dart';

import '../../domain/repository/carts_repository.dart';
import '../carts_data_sources/remote/cart_remote_datasource.dart';
import '../model/cart_model.dart';

class CartRepositoryImpl implements CartRepository{
  final CartRemoteDataSource cartRemoteDataSource;

  CartRepositoryImpl(this.cartRemoteDataSource);

  @override
  Future<List<CartEntity>> getCart() async{
    try{
      final response = await cartRemoteDataSource.getCartView();
      if(response.statusCode ==200 || response.statusCode ==201){
        List<dynamic> dataJson =   response.data['carts'];
        return dataJson.map((e)=>CartModel.fromJson(e)).toList();
      }
      else{
        throw Exception('Something went wrong');
      }
    }catch(e){
      print(e);
      throw Exception("Internal Server Error at: $e");
    }
  }


}