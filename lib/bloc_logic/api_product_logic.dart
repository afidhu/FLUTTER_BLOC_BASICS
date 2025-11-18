import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_basics/bloc_events/api_product_events.dart';
import 'package:flutter_bloc_basics/bloc_state/api_product_fetch_state.dart';
import 'package:flutter_bloc_basics/data/api_provider/apiProvider.dart';
import 'package:hive_flutter/adapters.dart';

import '../data/model/product_model.dart';

class ProductBloc extends Bloc<ProductEvents, ProductState> {
  ProductBloc() : super(InitialProduct()) {

    final Box<ProductModel> box = Hive.box<ProductModel>('productBox');



    on<LoadingProductData>((event, emit) async {
      emit(LoadingProduct());

      if (box.isNotEmpty) {
        emit(SuccessProduct(box.values.toList()));
        return;
      }

      try {
        final productData = await ApiService().fetchProduct();
        for (var product in productData) {
          box.put(product.id, product);
        }
        emit(SuccessProduct(productData));
      } catch (e) {
        emit(ErrorProduct(e.toString()));
      }
    });
  }
}
