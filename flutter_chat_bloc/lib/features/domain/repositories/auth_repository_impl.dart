
import 'package:flutter_chat_bloc/features/domain/enities/user_entity.dart';

import '../../data/datasource/auth_datasource.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository{

  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl(this.authRemoteDataSource);
  @override

  Future<UserEntity> login(String email, String password) async {
    // TODO: implement login
    return await  authRemoteDataSource.remoteLogin(email, password);
  }


  @override
  Future<UserEntity> register(String email, String password, String name)async {
    // TODO: implement register
return await authRemoteDataSource.remoteRegister(email, password, name);

  }
}