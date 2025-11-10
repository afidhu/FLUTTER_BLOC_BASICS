

import '../../data/datasource/auth_datasource.dart';
import '../../data/models/users_model.dart';

class UsersRepository{
  final  AuthRemoteDataSource authRemoteDataSource;
  UsersRepository(this.authRemoteDataSource);

  Future<List<UsersModel>> getAllUsers() async{
    try{
      final response = await authRemoteDataSource.allUsers();
    if(response.statusCode == 200){
      List<dynamic> jsonList =response.data;
      List<UsersModel> userList = jsonList.map((json) => UsersModel.fromJson(json)).toList();
      return userList;
    }else{
      throw Exception('Failed to load users');
    }
    }catch(e){
      throw Exception('Error: $e');
    }

  }

}
