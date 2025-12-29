
abstract class PostsEvents{}

class FetchPosts extends PostsEvents{}

class PostData extends PostsEvents {
  final String title;
  final String content;

  PostData(this.title, this.content);

}