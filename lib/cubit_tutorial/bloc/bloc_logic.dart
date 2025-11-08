

import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_event.dart';

class CounterBloc extends Bloc<CounterApp, int> {
  CounterBloc():super(0){

    on<BlocIncrementEvent>((event,emit){
      emit(state+1);
    });

    on<BlocDecrementEvent>((event,emit){
      emit(state-1);
    });
  }
}