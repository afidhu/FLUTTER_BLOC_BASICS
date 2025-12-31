import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_clean_architecture/features/products/domain/entities/product_entity.dart';
import 'package:meta/meta.dart';

import '../../domain/usecase/product_usecase.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProductUseCase _getProductUseCase;
  ProductsBloc(this._getProductUseCase) : super(ProductsInitial()) {
    on<GetProductEvent>(_getProduct) ;
  }




  FutureOr<void> _getProduct(GetProductEvent event, Emitter<ProductsState> emit) async{
    emit(ProductsLoading());
    try{
      final products = await _getProductUseCase.call();
      emit(ProductsLoaded(products));
    } catch(e){
      emit(ProductsLoadingError(e.toString()));
    }
  }
}
