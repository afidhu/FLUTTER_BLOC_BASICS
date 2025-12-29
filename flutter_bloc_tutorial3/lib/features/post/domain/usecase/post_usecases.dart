

import 'package:flutter_bloc_tutorial3/features/post/domain/entities/post_entity.dart';

import '../repository/local_post_repo.dart';
import '../repository/post_repo.dart';

// class GetPostsUseCase{
//
//   final PostRepository postRepository;
//   GetPostsUseCase(this.postRepository);
//   Future<List<Posts>> call() async{
//     return postRepository.getPosts();
//   }
// }

// class GetLocalPostsUseCase{
//   final LocalPostRepository localPostRepository;
//   GetLocalPostsUseCase(this.localPostRepository);
//   Future<List<Posts>> call() async{
//     return localPostRepository.getLocalPosts();
//   }
// }

// class PostPostsUseCase {
//
//   final PostRepository postRepository;
//   PostPostsUseCase(this.postRepository);
//   Future<Posts> call(){
//     return postRepository.postingPosts(postData);
//   }
// }