

import '../entities/posts_entity.dart';
import '../repository/post_repository.dart';

class GetPostUseCase extends PostEntity{

  final PostRepository postRepository;

  const GetPostUseCase(this.postRepository);

  Future<List<PostEntity>> call() async{
    return postRepository.getPosts();
  }

}