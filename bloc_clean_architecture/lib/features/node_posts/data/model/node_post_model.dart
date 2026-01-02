

import '../../domain/entities/node_post_entity.dart';

/// id : 6
/// createdAt : "2025-11-12T13:00:32.635Z"
/// updatedAt : "2025-11-12T13:00:32.635Z"
/// title : "pizza"
/// content : "wali kuku"
/// imageUrl : "https://prisma-backend-docker-neon.onrender.com/uploads/1762952430794-img2.jpeg"
/// published : false
/// authorId : 1
import 'dart:io';
import 'package:dio/dio.dart';

class NodePostModel extends NodePostEntity {
  const NodePostModel({
    super.id,
    super.createdAt,
    super.updatedAt,
    super.title,
    super.content,
    super.imageUrl,
    super.imagePath,
    super.published,
    super.authorId,
  });

  factory NodePostModel.fromJson(dynamic json) {
    return NodePostModel(
      id: json['id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      title: json['title'],
      content: json['content'],
      imageUrl: json['imageUrl'],
      published: json['published'],
      authorId: json['authorId'],
    );
  }

  /// ✅ FOR IMAGE UPLOAD
  Future<FormData> toFormData() async {
    return FormData.fromMap({
      'title': title,
      'content': content,
      'authorId': authorId,
      if (imagePath != null)
        'file': await MultipartFile.fromFile(
          imagePath!,
          filename: imagePath!.split('/').last,
        ),
    });
  }

  /// ✅ FOR NORMAL JSON (NO FILE)
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'imageUrl': imageUrl,
      'authorId': authorId,
    };
  }
}
