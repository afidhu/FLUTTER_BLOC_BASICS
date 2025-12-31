import 'package:bloc_clean_architecture/features/products/presentation/bloc/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProductsBloc>().add(GetProductEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      centerTitle: true,
      ),
      body: Center(
        child: Container(
           child:  BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                if (state is ProductsLoading) {
                  return const CircularProgressIndicator();
                } else if (state is ProductsLoadingError) {
                  return Text(state.message);
                } else if (state is ProductsLoaded) {
                  return ListView.builder(
                    itemCount: state.products.length,
                      itemBuilder: (context,index){
                        var data = state.products[index];
                        return InkWell(
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text('${index+1}'),
                            ),
                            title: Text(data.title.toString()),
                            subtitle: Text(data.price.toString()),

                            trailing: Image.network(data.images![0].toString()),
                          ),
                        );
                      }
                  );
                }
                return SizedBox.shrink();
              },
            )
        ),
      ),
    );
  }
}
