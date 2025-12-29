import 'dart:convert';

import 'package:flutter_bloc_tutorial3/features/post/domain/entities/post_entity.dart';

class PostsModel {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String title;
  String content;
  String imageUrl;
  bool published;
  int authorId;

  PostsModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.published,
    required this.authorId,
  });

  factory PostsModel.fromRawJson(String str) => PostsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PostsModel.fromJson(Map<String, dynamic> json) => PostsModel(
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    title: json["title"],
    content: json["content"],
    imageUrl: json["imageUrl"],
    published: json["published"],
    authorId: json["authorId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "title": title,
    "content": content,
    "imageUrl": imageUrl,
    "published": published,
    "authorId": authorId,
  };


/// 🔥 THIS is toEntity()
  Posts toEntity() {
    return Posts(
      id: id,
      createdAt: DateTime.parse(createdAt.toIso8601String()),
      updatedAt: DateTime.parse(updatedAt.toIso8601String()),
      title: title,
      content: content,
      imageUrl: imageUrl,
      published: published,
      authorId: authorId,
    );
  }
}



