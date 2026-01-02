


import 'package:bloc_clean_architecture/features/node_posts/data/model/node_post_model.dart';
import 'package:bloc_clean_architecture/features/node_posts/domain/entities/node_post_entity.dart';

import '../../domain/repository/node_post_repository.dart';
import '../data_source/remote/node_post_reomte_source.dart';

class NodePostRepositoryImpl implements NodePostRepository {

  final NodePostRemoteDataSource postRemoteDataSource;

  NodePostRepositoryImpl(this.postRemoteDataSource);

  @override
  Future<List<NodePostEntity>> getPosts() async{
    try{
      final response = await postRemoteDataSource.getNodePost();
      if(response.statusCode ==200){
        List<dynamic> dataJson = response.data;
        return dataJson.map((e)=>NodePostModel.fromJson(e)).toList();
      }
      else{
        throw Exception('Something went wrong');
      }
    } catch(e){
      throw Exception('Internal server error at: ${e.toString()}');
    }
  }

  @override
  Future<bool> addPosts(posts)  async{

    try{
      final model  =NodePostModel(
        title: posts.title,
        content: posts.content,
        authorId: posts.authorId,
        imageUrl: posts.imageUrl
      );
      final formData = await model.toFormData();
      print(formData.fields); // shows title, content, authorId
      print(formData.files);  // shows image file info
      final response = await postRemoteDataSource.addNodePost(model);
      if(response.statusCode ==201){
        return true;
      }
      else{
        throw Exception('Something went wrong');
      }
    } catch(e){
      throw Exception('Internal server error at: ${e.toString()}');
    }
  }

}