
import 'package:flutter_chat_bloc/features/data/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_chat_bloc/features/services/app_services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRemoteDataSource{


  final dio =Dio(BaseOptions(
    baseUrl: 'http://192.168.1.133:5000',
    connectTimeout: Duration(seconds: 5),
    receiveTimeout: Duration(seconds: 3),
  ));

  Future<UserModel> remoteLogin(String email, String password) async {
    try{
      final response = await dio.post('/auth/login', data: {'email': email, 'password': password,});
      if(response.statusCode == 200 ||response.statusCode == 201  ){
        await AppService().getXStorage.write('token',response.data['token']);
        dio.options.headers['Authorization'] = 'Bearer ${response.data['token']}';
        final varifiedUser = await dio.get('/auth/verify');
        print('varifiedUser: ${varifiedUser.data}');
        return UserModel.fromJson(varifiedUser.data);
      }else{
        throw Exception('Failed to login');
      }
    }catch(e){
      throw Exception(e);
    }
  }



  Future<UserModel> remoteRegister(String email, String password,String name) async {
    try{
      final response = await dio.post('/auth/register', data: {'email': email, 'password': password,"name":name, });
      if(response.statusCode == 200  ||response.statusCode == 201 ){
        print(response.data);
        return UserModel.fromJson(response.data);
      }else{
        throw Exception('Failed to login');
      }
    }catch(e){
      throw Exception(e);
    }



  }


  Future<Response> userMessage(id) async{
    try {
      // final response = await dio.get('/message/$id');
      //
      // print( 'response:  ${response.data}');
    return await dio.get('/message/$id');

    }
    catch(e){
      throw Exception(e);
    }
  }


}


