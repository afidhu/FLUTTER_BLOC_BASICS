
abstract class ProductsCartEvents{}
abstract class CartEvents{}


class  ProductFetch extends ProductsCartEvents{}
class  ProductAdd extends ProductsCartEvents{}

class  AddToCart extends CartEvents{
 final int id;
 AddToCart(this.id,);
}

class CartDataEvent extends CartEvents{}

class CartDataCountEvent extends CartEvents{}


// class  DeleteCart extends CartEvents{
//  final int id;
//  DeleteCart(this.id,);
// }