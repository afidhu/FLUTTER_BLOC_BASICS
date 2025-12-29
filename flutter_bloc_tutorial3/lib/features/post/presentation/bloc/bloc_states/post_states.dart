
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_tutorial3/features/post/domain/entities/post_entity.dart';

abstract class PostState extends Equatable{
  @override
  List<Object> get props => [];
}

class PostInitial extends PostState{}
class PostLoading extends PostState{}
class PostLoadingError extends PostState{
  final String error;
  PostLoadingError(this.error);
}
class PostLoaded extends PostState {
  final List<Posts> posts;
  PostLoaded(this.posts);
}