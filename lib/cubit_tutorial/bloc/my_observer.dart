
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_rx/get_rx.dart';

import '../cubits/cubit_logic.dart';
import 'bloc_event.dart';

class MyObserver extends BlocObserver{
  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
    super.onTransition(bloc, transition);
    print('Transition ${transition.toString()}');
    print('bloc Name ${bloc.runtimeType}');
    print('bloc Events: ${transition.event}');
    // print('transition Events: ${transition.runtimeType}');
    print('bloc State ${transition.currentState}');
    print('bloc State ${transition.nextState}');

    if (transition.event is BlocIncrementEvent){
      print('Increment function applied');

    }else if (transition.event is BlocDecrementEvent){
      print('Decrement function applied');

    }
    else{
      print('Unknown');

    }


  }


  @override
  void onChange(BlocBase bloc, Change change) {
    // TODO: implement onChange
    super.onChange(bloc, change);
    print('Change ${change.toString()}');
    print('curente state ${change.currentState}');
    print('next state ${change.nextState}');

  }


  ///This work in Cubit Not in Bloc
  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
    super.onEvent(bloc, event);
    print('Event ${event.toString()}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(bloc, error, stackTrace);
    print('Error ${error.toString()}');

  }
}