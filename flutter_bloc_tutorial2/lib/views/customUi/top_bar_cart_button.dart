import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc_logics.dart';
import '../../bloc/bloc_states.dart';

class TopBarCartButton extends StatefulWidget {
  const TopBarCartButton({super.key});

  @override
  State<TopBarCartButton> createState() => _TopBarCartButtonState();
}

class _TopBarCartButtonState extends State<TopBarCartButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc,CartState>(
        builder: (context, state){

          if(state is CartLoadedCount){
            return IconButton(
              onPressed: () {

              },
              icon: Text.rich(
                TextSpan(
                  children:[
                    TextSpan(
                    text: 'Count:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )
                ),
                    TextSpan(
                      text: '${state.countsTotal}',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                    )
                    )
                  ]
                )
              ),
            );
          }
          return SizedBox();

        }
    );
  }
}
