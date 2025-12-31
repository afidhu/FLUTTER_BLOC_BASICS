


import 'package:bloc_clean_architecture/features/products/domain/entities/review_entity.dart';
import 'package:equatable/equatable.dart';

import 'dimension_entity.dart';
import 'meta_entity.dart';

class ProductEntity extends Equatable{

final int? id;
final String? title;
final String? description;
final String? category;
final double? price;
final double? discountPercentage;
final double? rating;
final int? stock;
final List<String>? tags;
final String? brand;
final String? sku;
final double? weight;
final DimensionsEntity? dimensions;
final String? warrantyInformation;
final String? shippingInformation;
final String? availabilityStatus;
final List<ReviewEntity>? reviews;
final String? returnPolicy;
final int? minimumOrderQuantity;
final MetaEntity? meta;
final List<String>? images;
final String? thumbnail;

ProductEntity({
this.id,
this.title,
this.description,
this.category,
this.price,
this.discountPercentage,
this.rating,
this.stock,
this.tags,
this.brand,
this.sku,
this.weight,
this.dimensions,
this.warrantyInformation,
this.shippingInformation,
this.availabilityStatus,
this.reviews,
this.returnPolicy,
this.minimumOrderQuantity,
this.meta,
this.images,
this.thumbnail,});
  @override
  // TODO: implement props
  List<Object?> get props =>[id,title,description,category,price,discountPercentage,rating,stock,tags,brand,sku,weight,dimensions,warrantyInformation,shippingInformation,availabilityStatus,reviews,returnPolicy,minimumOrderQuantity,meta,images,thumbnail];

}