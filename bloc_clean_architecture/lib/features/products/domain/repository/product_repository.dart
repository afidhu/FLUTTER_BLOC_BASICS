

import '../entities/product_entity.dart';

abstract class ProductRepository{


  Future<List<ProductEntity>> getProductsList();
  Future<ProductEntity> addProductsList();
}