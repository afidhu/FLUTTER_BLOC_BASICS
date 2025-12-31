part of 'products_bloc.dart';

@immutable
sealed class ProductsState  {}

 class ProductsInitial extends ProductsState {}
 class ProductsLoading extends ProductsState {}
 class ProductsLoadingError extends ProductsState {
  final String message;
  ProductsLoadingError(this.message);
 }
 class ProductsLoaded extends ProductsState {
  final List<ProductEntity> products;
  ProductsLoaded(this.products);
 }
