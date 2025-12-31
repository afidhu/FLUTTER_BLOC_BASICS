

import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable{

final int? id;
final String? title;
final double? price;
final int? quantity;
final double? total;
final double? discountPercentage;
final double? discountedTotal;
final String? thumbnail;

 const ProductEntity(this.id, this.title, this.price, this.quantity, this.total, this.discountPercentage, this.discountedTotal, this.thumbnail);

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, price, quantity, total, discountPercentage, discountedTotal, thumbnail];

}