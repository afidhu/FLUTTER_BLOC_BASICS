

import 'package:bloc_clean_architecture/core/utils/network/dio_client.dart';
import 'package:dio/dio.dart';

class NodePostRemoteDataSource{


  Future<Response> getNodePost() async{
    try{
      return await NodeDioClient().dio.get('/post');
    } catch(e){
      print(e);
      rethrow;
    }
  }


  Future<Response> addNodePost( posts) async{
    try{
      final formData = await posts.toFormData();
      return await NodeDioClient().dio.post('/post', data: formData,
          options: Options(
            contentType: 'multipart/form-data',
          )
      );
    } catch(e){
      print(e);
      rethrow;
    }
  }

}