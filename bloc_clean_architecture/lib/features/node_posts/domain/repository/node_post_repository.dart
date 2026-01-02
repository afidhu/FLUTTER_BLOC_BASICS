


import '../entities/node_post_entity.dart';

abstract class NodePostRepository{

  Future<List<NodePostEntity>> getPosts();
  Future<bool> addPosts(NodePostEntity post);
}