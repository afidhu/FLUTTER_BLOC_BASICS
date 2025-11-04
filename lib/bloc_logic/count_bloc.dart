
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_basics/bloc_events/counter_evet.dart';
import 'package:flutter_bloc_basics/bloc_state/counter_sate.dart';

class CountBloc extends Bloc<CountEvent, CounterState>{
  CountBloc():super(CounterState(count: 0)){
    on<CountIncrementEvent>((event, emit){
      emit(CounterState(count: state.count+1));
    });
    on<CountDecrementEvent>((event, emit){
      emit(CounterState(count: state.count - 1));
    });

    on<CountResetEvent>((event, emit){
      emit(CounterState(count: state.count));
    });
  }
}
