


import 'package:bloc_clean_architecture/features/carts/domain/entities/cart_entity.dart';
import 'package:hive/hive.dart';

import '../../domain/repository/carts_repository.dart';
import '../carts_data_sources/remote/cart_remote_datasource.dart';
import '../model/cart_model.dart';

class CartRepositoryImpl implements CartRepository{
  final CartRemoteDataSource cartRemoteDataSource;

  CartRepositoryImpl({required this.cartRemoteDataSource, required this.cartsBox});

  final Box cartsBox;
  final cartBox =Hive.box('cartsBox');
  @override
  Future<List<CartEntity>> getCart() async{
    try{
      if(cartBox.isNotEmpty){
        final cartLocal = cartBox.values.toList();
        return cartLocal.map((e)=>CartModel.fromJson(e)).toList();
      }
      final response = await cartRemoteDataSource.getCartView();
      if(response.statusCode ==200 || response.statusCode ==201){
        List<dynamic> dataJson =   response.data['carts'];
        cartBox.addAll(dataJson);
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