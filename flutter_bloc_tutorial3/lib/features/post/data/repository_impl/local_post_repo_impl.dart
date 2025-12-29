

import 'package:flutter_bloc_tutorial3/features/post/domain/entities/post_entity.dart';
import 'package:flutter_bloc_tutorial3/features/post/domain/repository/local_post_repo.dart';
import 'package:hive/hive.dart';

import '../model/post_model.dart';

class LocalPostRepositoryImpl implements LocalPostRepository{

  var postsBox = Hive.box('postBox');
  @override
  Future<List<Posts>> getLocalPosts()  async {
    try {
      if(postsBox.isNotEmpty){
        List jsonData =postsBox.values.toList();
        final models = jsonData.map((json) {
          return PostsModel.fromJson(Map<String, dynamic>.from(json),);
        }).toList();
        final postList = models.map((model) => model.toEntity()).toList();

        return postList;
      }
      return [];
    } catch (e) {
      print(e.toString());
      throw Exception('Something went wrong : ${e.toString()}');
    }
  }
}



