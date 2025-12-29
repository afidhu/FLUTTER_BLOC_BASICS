

import 'package:dio/dio.dart';

import '../../../../network/dio_client.dart';

class PostRemoteDataSource{

  Future<Response>  getAllPost() async{
    try{
      return await DioClient().dio.get('/post');
    } catch(e){
      throw Exception('Something went wrong');
    }
  }

  Future<Response>  addPost(post) async{
    try{
      return await DioClient().dio.get('/post', data: post.toJson());
    } catch(e){
      throw Exception('Something went wrong');
    }
  }
}