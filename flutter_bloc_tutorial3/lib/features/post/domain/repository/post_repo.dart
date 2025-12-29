

import 'package:flutter_bloc_tutorial3/features/post/domain/entities/post_entity.dart';

abstract class PostRepository{

  Future<List<Posts>> getPosts();
Future<Posts> postingPosts(Posts post);
}
