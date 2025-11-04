import '../data/model/product_model.dart';

abstract class ProductState{}

class InitialProduct extends ProductState{}
class LoadingProduct extends ProductState{}

class SuccessProduct extends ProductState{
  List<ProductModel> productModel;
  SuccessProduct(this.productModel);
}

class ErrorProduct extends ProductState{
  final String errorMessage;
  ErrorProduct(this.errorMessage);
}