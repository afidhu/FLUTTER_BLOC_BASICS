
import 'package:faker/faker.dart';
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'cubit_state.dart';

// abstract class CountCubit1{}
// sealed class CountCubit1{}
class CountCubit extends Cubit<int>{
  CountCubit():super(0);

  void increment(){
    emit(state+1);
  }
  void decrement()=>emit(state-1);

  /////////THIS IS USED IN UNDO snario in BOTH CUBIT AND BLOC STATE MANAGER
  // @override
  //
  // void onChange(Change<int> change) {
  //   // TODO: implement onChange
  //   super.onChange(change);
  //   print('onChange: ${change.runtimeType.toString()}');
  //   print('currentState: ${change.currentState.toString()}');
  //   print('nextState: ${change.nextState.toString()}');
  // }


/////////THIS IS USED IN UNDO snario in BOTH CUBIT AND BLOC STATE MANAGER

// void onChangeFun(){
  //   onChange(Change(currentState: state, nextState: state));
  // }


/////////THIS IS USED IN  in BOTH CUBIT AND BLOC STATE MANAGER
//
// @override
//   void onError(Object error, StackTrace stackTrace) {
//     // TODO: implement onError
//     super.onError(error, stackTrace);
//     if(state >2){
//     print('onError: $error');
//     print('stackTrace: $stackTrace');
//   }}


/////////THIS IS USED IN  in BOTH CUBIT AND BLOC STATE MANAGER



// void onErrorFun(){
// onError(state, StackTrace.current);
// }


/////////THIS IS USED IN  in  CUBIT AND BLOC STATE MANAGER
// void onTransition(Transition<CountCubit, int> transition) {
//   // TODO: implement onTransition
//   super.onTransition(transition);
//   print('onTransition: ${transition.runtimeType.toString()}');
//   print('currentState: ${transition.currentState.toString()}');
// }

  // void onEvent(CountCubit event) {
  //   // TODO: implement onEvent
  //   super.onEvent(event);
  //   print('onEvent: ${event.runtimeType.toString()}');
  // }



/////////THIS IS USED IN  in BLOC STATE MANAGER to take current event work on and can do ,more logic here

// void autoClear(){
  //   Timer.periodic(Duration(seconds: 5), (_){
  //     print('clearing state');
  //     emit(0);
  //   });
  // }
}

// class myState{
//   final bool _isTrue;
//   myState(this._isTrue);
//
//
// }

class WithoutRequatable extends Cubit<bool>{
  WithoutRequatable():super(true);

  void equatableBool(){

    emit(!state);
  }
}



class CubitProfileLog extends Cubit<ProfileSate>{
  CubitProfileLog():super(InitialName());

  void changeMyName(myName){
    emit(ChangeName(myName));
  }

  void generateEmail(){
    emit(GenerateEmail(faker.internet.email()));

  }
}


///////IMage picker
final ImagePicker picker = ImagePicker();
class ImagePickerCubit extends Cubit<ImagePickerState>{
  ImagePickerCubit():super(imagePickerInitial());


  Future<void> pickImages() async {
emit(imagePickerLoading());
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image!.path.isNotEmpty) {
      emit(imageLoadedSuccess(image.path));
    }else{
      emit(imageLoadedFailure('No image selected'));
    }

  }
}
