

import '../entities/cart_entity.dart';

abstract class CartRepository{

  Future<List<CartEntity>> getCart();
}