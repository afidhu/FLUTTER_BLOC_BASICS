

import '../entities/post_entity.dart';

abstract class LocalPostRepository{

  Future<List<Posts>> getLocalPosts();
}
