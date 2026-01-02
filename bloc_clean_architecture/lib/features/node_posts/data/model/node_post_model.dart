/// id : 6
/// createdAt : "2025-11-12T13:00:32.635Z"
/// updatedAt : "2025-11-12T13:00:32.635Z"
/// title : "pizza"
/// content : "wali kuku"
/// imageUrl : "https://prisma-backend-docker-neon.onrender.com/uploads/1762952430794-img2.jpeg"
/// published : false
/// authorId : 1

class NodePostModel {
  NodePostModel({
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.title, 
      this.content, 
      this.imageUrl, 
      this.published, 
      this.authorId,});

  NodePostModel.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    title = json['title'];
    content = json['content'];
    imageUrl = json['imageUrl'];
    published = json['published'];
    authorId = json['authorId'];
  }
  int? id;
  String? createdAt;
  String? updatedAt;
  String? title;
  String? content;
  String? imageUrl;
  bool? published;
  int? authorId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['title'] = title;
    map['content'] = content;
    map['imageUrl'] = imageUrl;
    map['published'] = published;
    map['authorId'] = authorId;
    return map;
  }

}