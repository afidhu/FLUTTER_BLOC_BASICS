import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/api_service.dart';
import '../data/models.dart';
import '../data/product_repository.dart';
import 'bloc_events.dart';
import 'bloc_states.dart' hide DeleteCart;

class ProductCartBloc extends Bloc<ProductsCartEvents, ProductCartState> {
  ProductCartBloc() : super(InitialProduct()) {
    on<ProductFetch>(getProducts);
  }

  Future<void> getProducts(event, emit) async {
    emit(LoadingProduct());
    try {
      final productList = await ProductRepository(ApiServices()).getData();
      emit(LoadedSuccessProduct(productList));
    } catch (e) {
      emit(ErrorProduct(e.toString()));
    }
  }

  Future<void> addToCart(event, emit) async {
    // emit(LoadingCart());
    try {
      CartModel cartModel = CartModel(productId: event.id);
      final bool is_added = await ProductRepository(ApiServices(),).postToCart(cartModel);
      print(is_added);

      emit(AddCartMessage('Product added to cart'));
    } catch (e) {
      emit(ErrorProduct(e.toString()));
      print(e);
    }
  }
}


////////////CART BLOC
class CartBloc extends Bloc<CartEvents, CartState> {
  CartBloc() : super(InitialCart()) {
    on<CartDataCountEvent>(readCartCount);
    on<AddToCart>(addToCart);
    // on<DeleteCart>(deleteFromCart);
  }

  Future<void> addToCart(event, emit) async {
    emit(LoadingCart());
    try {
      CartModel cartModel = CartModel(productId: event.id);
      final bool is_added = await ProductRepository(ApiServices(),).postToCart(cartModel);
      print(is_added);
      emit(AddCartMessage('Success added to cart'));
      final total_count = await ProductRepository(ApiServices(),).getCartCountData();

      emit(CartLoadedCount(total_count.counts!.toInt()));
    } catch (e) {
      emit(ErrorProduct(e.toString()));
      print(e);
    }
  }


  Future<void> readCartCount(event, emit) async {
    try {
    final total_count = await ProductRepository(ApiServices(),).getCartCountData();
      print(total_count.counts);
      emit(CartLoadedCount(total_count.counts!.toInt()));
    } catch (e) {
      emit(ErrorProduct(e.toString()));
      print(e);
    }
  }



}
