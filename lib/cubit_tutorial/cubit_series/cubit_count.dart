import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_basics/cubit_tutorial/bloc/bloc_event.dart';

import '../bloc/bloc_logic.dart';
import '../cubits/cubit_logic.dart';

class CubitCount extends StatefulWidget {
  const CubitCount({super.key});

  @override
  State<CubitCount> createState() => _CubitCountState();
}

class _CubitCountState extends State<CubitCount> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
// cubit.autoClear();
  }
  final cubit =CountCubit();
  final _bloc =CounterBloc();

  @override
  Widget build(BuildContext context) {
    // print('_bloc $_bloc');
    // print('_bloc $cubit');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Count'),

      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Text('Cubit Counter'),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BlocBuilder<CountCubit, int>(
                bloc: cubit,

                builder: (context,state)=> Text(state.toString()),
              ),
              ElevatedButton(onPressed: cubit.increment
                  , child: const Text('Increment')),
              ElevatedButton(onPressed: cubit.decrement
                  , child: const Text('Decrement')),
            ],
          ),
            const SizedBox(height: 20,),
            Text('Bloc Counter'),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BlocBuilder<CounterBloc, int>(
                bloc: _bloc,

                builder: (context,state)=> Text(state.toString()),
              ),
              ElevatedButton(onPressed: (){_bloc.add(BlocIncrementEvent());}
                  , child: const Text('Increment')),
              ElevatedButton(onPressed: (){_bloc.add(BlocDecrementEvent());}
                  , child: const Text('Decrement')),
            ],
          ),
          ],
        ),
      ),
    );
  }
}
