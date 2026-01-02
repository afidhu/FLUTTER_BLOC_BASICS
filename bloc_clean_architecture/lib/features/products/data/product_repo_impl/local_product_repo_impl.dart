import 'package:bloc_clean_architecture/features/products/domain/entities/product_entity.dart';
import 'package:hive/hive.dart';

import '../../domain/repository/product_repository.dart';
import '../model/ProductsModel.dart';


class LocalProductsRepositoryImpl implements ProductRepository{

  // final localProducts = Hive.box('productsBox');
  final  Box localProducts;

  LocalProductsRepositoryImpl(this.localProducts);

  @override
  Future<List<ProductEntity>> getProductsList() async {
    // print(localProducts.values.toList());
    if(localProducts.isNotEmpty){
    final productList = localProducts.values.toList();
      return productList.map((e)=>ProductsModel.fromJson(e)).toList();
    }
    return [];
  }

  @override
  Future<ProductEntity> addProductsList() {
    // TODO: implement addProductsList
    throw UnimplementedError();
  }

}