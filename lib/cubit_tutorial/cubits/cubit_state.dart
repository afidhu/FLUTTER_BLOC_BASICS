

import 'package:equatable/equatable.dart';


abstract class ProfileSate{}

class InitialName extends ProfileSate{}
class ChangeName extends ProfileSate{
  final String name;
  // final int age;
  ChangeName(this.name);
  // @override
  // String toString() {
  //   return 'ChangeName{name: $name}';
  }

class GenerateEmail extends ProfileSate {
  final String myEmail;

  GenerateEmail(this.myEmail);
}



//////////This prevent rebuild each time, or can use as buildWith in blocbulder
class MyEquatable extends Equatable{
  final int age;
  MyEquatable(this.age);

  @override
  bool get stringify => true;

  @override
  // TODO: implement props
  List<Object?> get props {
    return [age];
  }
}



abstract class ImagePickerState {}

class imagePickerInitial extends ImagePickerState {}

class imagePickerLoading extends ImagePickerState{}

class imageLoadedSuccess extends ImagePickerState{
  final String imageUrl;
  imageLoadedSuccess(this.imageUrl);
}

class imageLoadedFailure extends ImagePickerState{
  final String error;
  imageLoadedFailure(this.error);
}
