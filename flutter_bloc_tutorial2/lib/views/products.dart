import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../bloc/bloc_events.dart';
import '../bloc/bloc_logics.dart';
import '../bloc/bloc_states.dart';
import 'customUi/cartButton.dart';
import 'customUi/favorate_button.dart';
import 'customUi/top_bar_cart_button.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProductCartBloc>().add(ProductFetch());
    context.read<CartBloc>().add(CartDataCountEvent());
    // context.read<ProductCartBloc>().add(CartDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        centerTitle: true,

        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.white, Colors.blue],
            ),
          ),
        ),
        actions: [
          // FavorateButton(),
          // CartButton(),
          TopBarCartButton(),
        ],
      ),

      body: Center(
        child: RefreshIndicator(
          child: BlocListener<CartBloc, CartState>(
            listener: (context, state) async{
              if(state is LoadingCart){
               await Future.delayed(Duration(seconds: 1));
               Get.snackbar(
                 'Loading',
                 'Still adding...',
                 backgroundColor: Colors.blue,
                 colorText: Colors.white,
                 forwardAnimationCurve: Curves.decelerate,
                 duration: Duration(seconds: 1),
               );
              }
           else if(state is AddCartMessage){
                await Future.delayed(Duration(seconds: 1));
                Get.snackbar(state.message, '',
                  // maxWidth: double.infinity,
                  forwardAnimationCurve: Curves.bounceOut,
                  duration: Duration(seconds: 1),
                  // animationDuration: Duration(seconds: 2),
                  // showProgressIndicator: true,

                  colorText: Colors.white,
                  backgroundColor: Colors.black,
                  backgroundGradient: LinearGradient(colors:
                  [
                    Colors.blue,
                    Colors.purple,
                    Colors.redAccent,
                  ]),
                  snackPosition: SnackPosition.BOTTOM,
                  messageText: Container(
                    color: Colors.black,
                    child: Center(
                      child: LinearProgressIndicator(color: Colors.redAccent,),

                    ),)
                );

              }
            },
            child: BlocBuilder<ProductCartBloc, ProductCartState>(
              builder: (context, state) {
                if (state is LoadingProduct) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ErrorProduct) {
                  return Center(child: Text(state.errormessage.toString()));
                } else if (state is LoadedSuccessProduct) {
                  return ListView.builder(
                    itemCount: state.products.length,

                    itemBuilder: (context, index) {
                      var data = state.products[index];
                      return Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Text(data.title.toString()),
                            Text('\$ ${data.price}'),
                            Text(data.description.toString()),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FavorateButton(),
                                CartButton(productId: data.id?.toInt()),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );

                }
                return SizedBox();
              },

            ),
          ),


          onRefresh: () async {},
        ),

      ),
    );
  }
}
