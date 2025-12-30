

import 'package:bloc_clean_architecture/features/posts/domain/entities/reaction_entity.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/posts_model.dart';

class PostEntity extends Equatable{
final int? id;
final String? title;
final String? body;
final List<String>? tags;
final ReactionEntity? reactions;
final int? views;
final int? userId;

 const PostEntity({this.id, this.title, this.body, this.tags, this.reactions, this.views, this.userId});

  @override
  // TODO: implement props
 List<Object?> get props => [id,title,body,tags,reactions,views,userId];
}