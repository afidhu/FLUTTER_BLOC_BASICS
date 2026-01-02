


import '../entities/node_post_entity.dart';
import '../repository/node_post_repository.dart';

class NodeAddPostUseCase{

  final NodePostRepository nodePostRepository;

  NodeAddPostUseCase(this.nodePostRepository);
  Future<bool> call(NodePostEntity posts) async{
    return nodePostRepository.addPosts(posts);
  }
}