import 'dart:convert';

import 'package:dio/dio.dart';

import '../model/todo_model.dart';


class ApiServiceTodo {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.1.133:5000',
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 3),
      headers: {'Content-Type': 'application/json'},
    ),
  );


  ///////HERE FETCH DATA METHOD////////////////
  Future<List<TodoModel>> fetchPost()async{
    try{
      final response = await dio.get('/product');
      print(response.data);
      if(response.statusCode == 200){
        List<dynamic> dataList = response.data;
        List<TodoModel> todoList = dataList.map((json)=>TodoModel.fromJson(json)).toList();
        print(todoList);
        return todoList;
      }else{
        print('Failed to fetch posts');
        throw Exception('Failed to fetch post');
      }
    } catch(e){
      print('Internal error');
      print('ERRORAT_FETCHPOST: $e');
      throw Exception('server internal error');

    };
  }



  //////////HERE ADD POST METHOD////////////////
  Future<dynamic> addPost(TodoModel todoModel )async{
    try{
      final response = await dio.post('/product',data:todoModel.toJson() );
      if(response.statusCode == 201){
        print(response.data);
        return response.data;
      }else{
        throw Exception('Failed to add post');
      }
    } catch(e){
      print(e);

    };
  }
  
}