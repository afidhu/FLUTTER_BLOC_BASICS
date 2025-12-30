

import 'package:bloc_clean_architecture/features/posts/domain/entities/posts_entity.dart';

import '../../domain/repository/post_repository.dart';
import '../data_source/remote/poduct_remote_data.dart';
import '../model/posts_model.dart';

class PostRepositoryImpl implements PostRepository{

  final ProductDataSource productDataSource;

  PostRepositoryImpl(this.productDataSource);
  @override
  Future<List<PostEntity>> getPosts() async{
   try{
     final response = await productDataSource.getPosts();
     if(response.statusCode ==200 || response.statusCode ==201){
       List<dynamic> data = response.data['posts'];
       List<PostEntity> posts = data.map((e) => PostsModel.fromJson(e)).toList();
       return  posts;
     }else{
       throw Exception('Something went wrong');
     }
   } catch(e){
     print(e);
    throw Exception('Internal server error :$e');
   }
  }
}