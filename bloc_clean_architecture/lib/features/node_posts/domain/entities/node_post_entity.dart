

import 'package:equatable/equatable.dart';

class NodePostEntity extends Equatable{

final int? id;
final String? createdAt;
final String? updatedAt;
final String? title;
final String? content;
final String? imageUrl;
final String? imagePath;

final bool? published;
final int? authorId;

 const NodePostEntity({this.id, this.createdAt, this.updatedAt, this.title, this.content, this.imageUrl,this.imagePath, this.published, this.authorId});

  @override
  // TODO: implement props
  List<Object?> get props => [id, createdAt, updatedAt, title, content, imageUrl, published, authorId];


}