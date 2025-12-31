

import 'package:bloc_clean_architecture/features/products/data/model/ProductsModel.dart';
import 'package:bloc_clean_architecture/features/products/domain/entities/product_entity.dart';
import 'package:hive/hive.dart';

import '../../domain/repository/product_repository.dart';
import '../product_source_data/remote/product_source.dart';

class ProductRepositoryImpl implements ProductRepository{

  final ProductsRemoteSourceData productsRemoteSourceData;
  ProductRepositoryImpl(this.productsRemoteSourceData);

  final localProducts = Hive.box('productsBox');
  @override
  Future<List<ProductEntity>> getProductsList()  async{
    try{
      final response = await productsRemoteSourceData.getProducts();
      if( response.statusCode ==200 || response.statusCode==201){
        List<dynamic> dataJson = response.data['products'];
        localProducts.addAll(dataJson);
        return dataJson.map((e)=>ProductsModel.fromJson(e)).toList();
      }
      else {
        throw Exception('Something went wrong');
      }
    } catch(e){
      print(e);
      throw Exception("Internal Server Error at: $e");
    }
  }

  @override
  Future<ProductEntity> addProductsList() {
    // TODO: implement addProductsList
    throw UnimplementedError();
  }

}