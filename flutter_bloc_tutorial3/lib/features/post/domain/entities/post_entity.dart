class Posts {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String title;
  final String content;
  final String imageUrl;
  final bool published;
  final int authorId;

  Posts({
     this.id,
     this.createdAt,
     this.updatedAt,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.published,
    required this.authorId,
  });
}
