import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/cart_entity.dart';
import '../../domain/usecases/cart_usecase.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartUseCase _getCartUseCase;
  CartBloc(this._getCartUseCase) : super(CartInitial()) {
    on<GetCartEvent>(_getCart);

  }


  FutureOr<void> _getCart(GetCartEvent event, Emitter<CartState> emit)  async{
    emit(CartLoading());
    try{
      final cart = await _getCartUseCase.call();
      emit(CartLoaded(cart));
    } catch(e){
      emit(CartLoadingError(e.toString()));
    }
  }
}
