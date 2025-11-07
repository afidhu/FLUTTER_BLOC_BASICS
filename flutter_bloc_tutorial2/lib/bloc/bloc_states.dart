import '../data/models.dart';

abstract class ProductCartState{}
abstract class CartState{}

class InitialProduct extends ProductCartState{}
class LoadingProduct extends ProductCartState{}
class LoadedSuccessProduct extends ProductCartState{
  List<ProductModle> products;
  LoadedSuccessProduct(this.products);
}
class ErrorProduct extends ProductCartState{
  final String errormessage;
  ErrorProduct(this.errormessage);
}

class LoadedSuccessCart extends ProductCartState{
  List<CartModel> carts;
  LoadedSuccessCart(this.carts);
}

class LoadingCart extends CartState{}


class AddCartMessage extends CartState{
  final String message;
  AddCartMessage(this.message);

}

class InitialCart extends CartState{}

class CartLoadedCount extends CartState{
  final int countsTotal;
  CartLoadedCount(this.countsTotal);
}

// class DeleteCart extends CartState{}