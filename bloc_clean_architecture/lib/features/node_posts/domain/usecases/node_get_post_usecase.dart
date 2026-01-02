


import '../entities/node_post_entity.dart';
import '../repository/node_post_repository.dart';

class NodeGetPostUseCase{

  final NodePostRepository nodePostRepository;

  NodeGetPostUseCase(this.nodePostRepository);
  Future<List<NodePostEntity>> call() async{
    return nodePostRepository.getPosts();
  }
}