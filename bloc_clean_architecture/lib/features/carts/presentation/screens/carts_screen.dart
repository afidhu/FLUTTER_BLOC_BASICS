

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart_bloc.dart';

class CartsScreen extends StatefulWidget {
  const CartsScreen({super.key});

  @override
  State<CartsScreen> createState() => _CartsScreenState();
}

class _CartsScreenState extends State<CartsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CartBloc>().add(GetCartEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carts'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state){
              if(state is CartLoading){
                return const Center(child: CircularProgressIndicator(),);
              }
              if(state is CartLoadingError){
                return Center(child: Text(state.error),);
              }
              if(state is CartLoaded){
                return ListView.builder(
                    itemBuilder: (context,index){
                      var data =state.cart[index];
                      return ListTile(
                        leading: CircleAvatar(
                           child: Image.network(data.products![0].thumbnail.toString()),
                        ),
                        title: Text(data.products![0].title.toString()),
                      );
                    }
                );
              }
              return SizedBox.shrink();
            },
        ),
      ),
      ),
    );
  }
}
