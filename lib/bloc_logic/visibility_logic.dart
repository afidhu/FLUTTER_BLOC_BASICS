

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_basics/bloc_events/visibility_event.dart';
import 'package:flutter_bloc_basics/bloc_state/visibility_state.dart';

class VisibleBloc extends Bloc<VisibilityEvent, VisibilityState>{
  VisibleBloc():super(VisibilityState(is_visible: true)){

    on<ShowVisibleEvent>((event, emit){
      emit(VisibilityState(is_visible: true));
    });

    on<HideVisibleEvent>((event, emit){
      emit(VisibilityState(is_visible: false));
    });
    

  }
  ///Observable

  @override
  void onChange(Change<VisibilityState> change) {
    // TODO: implement onChange
    super.onChange(change);

    print(change.currentState.is_visible);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
    print(error);
  }

  @override
  void onTransition(Transition<VisibilityEvent, VisibilityState> transition) {
    // TODO: implement onTransition
    super.onTransition(transition);
    print(transition);
  }
}