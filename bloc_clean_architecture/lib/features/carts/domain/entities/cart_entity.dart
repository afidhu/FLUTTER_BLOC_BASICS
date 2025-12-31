

import 'package:equatable/equatable.dart';

import 'cart_products_entity.dart';

class CartEntity extends Equatable{

final int? id;
final List<CartProductEntity>? products;
final double? total;
final double? discountedTotal;
final int? userId;
final int? totalProducts;
final int? totalQuantity;

const  CartEntity({this.id, this.products, this.total, this.discountedTotal, this.userId, this.totalProducts, this.totalQuantity});

  @override
  // TODO: implement props
  List<Object?> get props => [id, products, total, discountedTotal, userId, totalProducts, totalQuantity];

}