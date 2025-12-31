import 'package:bloc_clean_architecture/features/products/data/model/dimension_model.dart';
import 'package:bloc_clean_architecture/features/products/data/model/meta_model.dart';
import 'package:bloc_clean_architecture/features/products/data/model/review_model.dart';

import '../../domain/entities/product_entity.dart';

/// id : 1
/// title : "Essence Mascara Lash Princess"
/// description : "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula."
/// category : "beauty"
/// price : 9.99
/// discountPercentage : 10.48
/// rating : 2.56
/// stock : 99
/// tags : ["beauty","mascara"]
/// brand : "Essence"
/// sku : "BEA-ESS-ESS-001"
/// weight : 4
/// dimensions : {"width":15.14,"height":13.08,"depth":22.99}
/// warrantyInformation : "1 week warranty"
/// shippingInformation : "Ships in 3-5 business days"
/// availabilityStatus : "In Stock"
/// reviews : [{"rating":3,"comment":"Would not recommend!","date":"2025-04-30T09:41:02.053Z","reviewerName":"Eleanor Collins","reviewerEmail":"eleanor.collins@x.dummyjson.com"},{"rating":4,"comment":"Very satisfied!","date":"2025-04-30T09:41:02.053Z","reviewerName":"Lucas Gordon","reviewerEmail":"lucas.gordon@x.dummyjson.com"},{"rating":5,"comment":"Highly impressed!","date":"2025-04-30T09:41:02.053Z","reviewerName":"Eleanor Collins","reviewerEmail":"eleanor.collins@x.dummyjson.com"}]
/// returnPolicy : "No return policy"
/// minimumOrderQuantity : 48
/// meta : {"createdAt":"2025-04-30T09:41:02.053Z","updatedAt":"2025-04-30T09:41:02.053Z","barcode":"5784719087687","qrCode":"https://cdn.dummyjson.com/public/qr-code.png"}
/// images : ["https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/1.webp"]
/// thumbnail : "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/thumbnail.webp"

class ProductsModel  extends ProductEntity{
  ProductsModel({
      super.id,
      super.title,
      super.description,
      super.category,
      super.price,
      super.discountPercentage,
      super.rating,
      super.stock,
      super.tags,
      super.brand,
      super.sku,
      super.weight,
      super.dimensions,
      super.warrantyInformation,
      super.shippingInformation,
      super.availabilityStatus,
      super.reviews,
      super.returnPolicy,
      super.minimumOrderQuantity,
      super.meta,
      super.images,
      super.thumbnail,});

factory  ProductsModel.fromJson(dynamic json) {
  final reviews = [];
  if (json['reviews'] != null) {
    json['reviews'].forEach((v) {
      reviews.add(ReviewsModel.fromJson(v));
    });
  }

  return ProductsModel(
    id: (json['id'] as num).toInt(),
    title: json['title'].toString(),
    description: json['description'].toString(),
    category: json['category'].toString(),
    price: (json['price'] as num).toDouble(),
    discountPercentage: (json['discountPercentage'] as num).toDouble(),
    rating: (json['rating'] as num).toDouble(),
    stock:(json['stock'] as num).toInt(),
    tags: json['tags'] != null ? json['tags'].cast<String>() : [],
    brand: json['brand'].toString(),
    sku: json['sku']?.toString(),
    weight: (json['weight'] as num).toDouble(),
    dimensions: json['dimensions'] != null ? DimensionsModel.fromJson(
        json['dimensions']) : null,
    warrantyInformation: json['warrantyInformation'].toString(),
    shippingInformation: json['shippingInformation'].toString(),
    availabilityStatus: json['availabilityStatus'].toString(),
    returnPolicy: json['returnPolicy'].toString(),
    minimumOrderQuantity:(json['minimumOrderQuantity'] as num).toInt(),
    meta: json['meta'] != null ? MetaModel.fromJson(json['meta']) : null,
    images: json['images'] != null ? json['images'].cast<String>() : [],
    thumbnail: json['thumbnail'].toString(),
  );
}
}

/// createdAt : "2025-04-30T09:41:02.053Z"
/// updatedAt : "2025-04-30T09:41:02.053Z"
/// barcode : "5784719087687"
/// qrCode : "https://cdn.dummyjson.com/public/qr-code.png"

/// rating : 3
/// comment : "Would not recommend!"
/// date : "2025-04-30T09:41:02.053Z"
/// reviewerName : "Eleanor Collins"
/// reviewerEmail : "eleanor.collins@x.dummyjson.com"


/// width : 15.14
/// height : 13.08
/// depth : 22.99
