import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_basics/bloc_events/counter_evet.dart';
import 'package:flutter_bloc_basics/bloc_logic/count_bloc.dart';
import 'package:flutter_bloc_basics/bloc_state/counter_sate.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CountsPge extends StatefulWidget {
  const CountsPge({super.key});

  @override
  State<CountsPge> createState() => _CountsPgeState();
}

class _CountsPgeState extends State<CountsPge> {
   // CountBloc countBloc =CountBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: Center(
        child: Column(
          children: [
            // BlocBuilder<CountBloc,CounterState>(
            //     // bloc: countBloc,
            //     builder: (context,state){
            //       return Text(state.count.toString(),style: TextStyle(fontSize: 30));
            //     }
            // ),

            ////////////Here BlocConsumer same as above bult is added listener
            BlocConsumer<CountBloc,CounterState>(
                listener: (context, state){
                  if(state.count >=3){
                    Get.defaultDialog(
                        title: 'Hey Is greater 3',
                        backgroundColor: Colors.grey,
                        actions: [
                          TextButton(
                              onPressed: (){
                                Get.back();
                              },
                              child: Icon(Icons.cancel)
                          ),TextButton(
                              onPressed: (){
                                Get.back();
                              },
                              child: Icon(Icons.thumb_up)
                          ),
                        ]
                    );
                  }
                },
                builder: (context,state){
                  return Text(state.count.toString(),style: TextStyle(fontSize: 30));
                }
            ),


            ////////HERE I ADD BLOCLISTENER
             BlocListener<CountBloc,CounterState>(
               listenWhen: (prev, current){
                 print(prev.count);
                 print(current.count);
                 return true;
               },
                 listener: (context, state){
                   if(state.count <= 0){
                     Get.defaultDialog(
                       title: 'Hey Is greater 3',
                       backgroundColor: Colors.grey,
                       actions: [
                         TextButton(
                             onPressed: (){
                               Get.back();
                             },
                             child: Icon(Icons.cancel)
                         ),TextButton(
                             onPressed: (){
                               Get.back();
                             },
                             child: Icon(Icons.thumb_up)
                         ),
                       ]
                     );
                   }
                 },
               child: Text('Here BlocListener'),
             ),


            ///HERE ADD BLOCSELECTOR//
            BlocSelector<CountBloc,CounterState, bool>(
                selector: (state)=>(state.count %2 == 0),
                builder: (context,isEven){
                  return isEven ? Text('Even', style: TextStyle(fontSize: 30), ) : Text('Odd', style: TextStyle(fontSize: 30), );
                },

            ),


            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green
                ),
                onPressed: (){
                  context.read<CountBloc>().add(CountIncrementEvent());
                },
                child: Text("Increment")
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue
                ),

                onPressed: (){
                  context.read<CountBloc>().add(CountDecrementEvent());
                },
                child: Text("Decrement")
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red
                ),
                onPressed: (){
                  context.read<CountBloc>().add(CountResetEvent());
                },
                child: Text("Reset")
            )
          ],
        ),
      ),
    );
  }
}
