
abstract class ProductsCartEvents{}
abstract class CartEvents{}
abstract class FavoriteEvents{}




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


class IsFavorite extends FavoriteEvents{
 final bool is_favorite;
 IsFavorite(this.is_favorite,);


}