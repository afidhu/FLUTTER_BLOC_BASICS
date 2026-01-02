

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

  //THIS IS NO FORM DATA JUST TEXT ONLY
  // Map<String, dynamic> toJson() {
  //   return {
  //     'title': title,
  //     'content': content,
  //     'imageUrl': imageUrl,
  //     'authorId': authorId,
  //
  //   };
  // }

  Future<FormData> toFormData() async {
    final formData = FormData();

    // TEXT FIELDS
    formData.fields.add(MapEntry('title', title ?? ''));
    formData.fields.add(MapEntry('content', content ?? ''));
    formData.fields.add(MapEntry('authorId', authorId.toString()));

    // FILE FIELD
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      formData.files.add(
        MapEntry(
          'file', // MUST match upload.single('file')
          await MultipartFile.fromFile(
            imageUrl!,
            filename: imageUrl!.split('/').last,
          ),
        ),
      );
    }

    return formData; // ✅ RETURN SAME OBJECT
  }



}
