import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_basics/bloc_state/api_product_fetch_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../bloc_events/api_product_events.dart';
import '../bloc_logic/api_product_logic.dart';


class ApiCall extends StatefulWidget {
  const ApiCall({super.key});

  @override
  State<ApiCall> createState() => _ApiCallState();
}

class _ApiCallState extends State<ApiCall> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProductBloc>().add(LoadingProductData());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Call'),

      ),
      body:Center(
          child: BlocBuilder<ProductBloc,ProductState>(
              builder: (context, state){
                if(state is LoadingProduct){
                  return LinearProgressIndicator(color: Colors.pink,);
                }
                else if(state is ErrorProduct){
                  return Text(state.errorMessage);
                }
                else if(state is SuccessProduct){
                  if(state.productModel.isEmpty){
                    return Text('No Data Found');
                  }else {
                    return ListView.builder(
                        itemCount: state.productModel.length,
                        itemBuilder: (context, index) {
                          var data = state.productModel[index];
                          return ListTile(
                            // leading: CircleAvatar(
                            //   child: Image.network(data.image.toString()),
                            // ),
                            leading:CachedNetworkImage(
                                imageUrl: data.image.toString(),
                                placeholder: (context, url) => CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                              width: 50,
                              height: 50,
                            ),
                            title: Text(data.title.toString()),
                          );
                        }
                    );
                  }
                }
                else{
                  return Text('Something went wrong');
                }
              }
          ),
        

      ) ,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ProductBloc>().add(LoadingProductData());
        },
        tooltip: 'Api',
        child: const Icon(Icons.refresh),
      )
    );
  }
}
