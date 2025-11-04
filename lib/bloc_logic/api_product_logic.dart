import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_basics/bloc_events/api_product_events.dart';
import 'package:flutter_bloc_basics/bloc_state/api_product_fetch_state.dart';
import 'package:flutter_bloc_basics/data/api_provider/apiProvider.dart';

import '../data/model/product_model.dart';

class ProductBloc extends Bloc<ProductEvents, ProductState> {
  ProductBloc() : super(InitialProduct()) {
    on<LoadingProductData>((event, emit) async {
      emit(LoadingProduct());

      try {
        final productData = await ApiService().fetchProduct();
        emit(SuccessProduct(productData));
      } catch (e) {
        emit(ErrorProduct(e.toString()));
      }
    });
  }
}
