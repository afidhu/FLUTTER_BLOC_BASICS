

import 'package:bloc_clean_architecture/features/carts/data/model/cart_model.dart';
import 'package:bloc_clean_architecture/features/carts/domain/entities/cart_entity.dart';
import 'package:get/get_connect/http/src/http/html/file_decoder_html.dart';
import 'package:hive/hive.dart';

import '../../domain/repository/carts_repository.dart';
import '../carts_data_sources/remote/cart_remote_datasource.dart';

class LocalCartRepositoryImpl implements CartRepository{
  final Box cartBox;
  LocalCartRepositoryImpl(this.cartBox);
  @override
  Future<List<CartEntity>> getCart() async{
    if(cartBox.isNotEmpty){
      final cartLocal = cartBox.values.toList();
      return cartLocal.map((e)=>CartModel.fromJson(e)).toList();
    }
    else{
      return [];
    }
  }

}