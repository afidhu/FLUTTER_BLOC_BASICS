
import '../entities/posts_entity.dart';

abstract class PostRepository{
  Future<List<PostEntity>> getPosts();
}