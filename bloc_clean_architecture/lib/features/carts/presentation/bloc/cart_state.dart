part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

 class CartInitial extends CartState {}
 class CartLoading extends CartState {}
class CartLoadingError extends CartState {
  final String error;

  CartLoadingError(this.error);
}
 class CartLoaded extends CartState {

 final List<CartEntity> cart;

  CartLoaded(this.cart);
}
