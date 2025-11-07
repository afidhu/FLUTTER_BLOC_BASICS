import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../bloc/bloc_events.dart';
import '../../bloc/bloc_logics.dart';
import '../../bloc/bloc_states.dart';

class CartButton extends StatelessWidget {
  final productId;
  const CartButton({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return IconButton(
          onPressed: () {
            context.read<CartBloc>().add(AddToCart(productId));
          },
          icon: Icon(Icons.add_shopping_cart),
        );
  }
}
