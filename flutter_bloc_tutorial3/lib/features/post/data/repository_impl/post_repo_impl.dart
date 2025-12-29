

import 'package:flutter_bloc_tutorial3/features/post/domain/entities/post_entity.dart';
import 'package:hive/hive.dart';

import '../../domain/repository/post_repo.dart';
import '../data_source/post_remote_data_source.dart';
import '../model/post_model.dart';

class PostRepositoryImpl implements PostRepository{

  var postsBox = Hive.box('postBox');

  final PostRemoteDataSource postRemoteDataSource;
  PostRepositoryImpl(this.postRemoteDataSource);

  @override
  Future<List<Posts>> getPosts()  async {
    try {
        final response = await postRemoteDataSource.getAllPost();
        if (response.statusCode == 200) {
          List<dynamic> jsonData = response.data;
          postsBox.addAll(jsonData);
          List<PostsModel> models = jsonData.map((json) => PostsModel.fromJson(json)).toList();
          // List<Posts> postList = jsonData.map((e) => Posts.fromJson(e)).toList();
          // return postList;
          List<Posts> postList =models.map((model) => model.toEntity()).toList();
          return postList;

        } else {
          throw Exception('Something went wrong');
        }
    } catch (e) {
      throw Exception('Something went wrong');
    }
  }

  @override
  Future<Posts> postingPosts(post) async {
    try {
      final response = await postRemoteDataSource.addPost(post);
      if (response.statusCode == 201) {

        var model = PostsModel.fromJson(response.data);
        return model.toEntity();

      } else {
        throw Exception('Something went wrong');
      }
    } catch (e) {
      throw Exception('Something went wrong');
    }

  }
}




