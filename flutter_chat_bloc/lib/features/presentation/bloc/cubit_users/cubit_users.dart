


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_bloc/features/domain/repositories/users_repository.dart';

import '../../../data/datasource/auth_datasource.dart';
import 'cubit_user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());


  void getAllUser() async{
    emit(LoadingUser());
    try{
      final userList = await UsersRepository(AuthRemoteDataSource()).getAllUsers();
      emit(LoadedUser(userList));
    } catch(e){
      emit(ErrorUser(e.toString()));
    }
  }
}