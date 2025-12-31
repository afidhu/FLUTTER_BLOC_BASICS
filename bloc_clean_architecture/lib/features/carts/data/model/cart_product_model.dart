

import '../../domain/entities/cart_products_entity.dart';

class CartProductsModel extends CartProductEntity{
 const CartProductsModel({
    super.id,
    super.title,
    super.price,
    super.quantity,
    super.total,
    super.discountPercentage,
    super.discountedTotal,
    super.thumbnail,});

 factory CartProductsModel.fromJson(dynamic json) {
   return CartProductsModel(
     id: json['id'],
     title: json['title'],
     price: (json['price'] as num).toDouble(),
     quantity: json['quantity'],
     total: (json['total'] as num).toDouble(),
     discountPercentage: (json['discountPercentage'] as num).toDouble(),
     discountedTotal: (json['discountedTotal']as num).toDouble(),
     thumbnail: json['thumbnail'],
   );
  }

}