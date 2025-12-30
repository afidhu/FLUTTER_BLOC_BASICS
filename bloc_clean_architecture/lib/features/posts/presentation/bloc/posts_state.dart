part of 'posts_bloc.dart';

@immutable
sealed class PostsState {}

 class PostsInitial extends PostsState {}

 class PostsLoading extends PostsState{}
 class PostsLoadSuccess extends PostsState{

  final List<PostEntity> postEntity;
  PostsLoadSuccess(this.postEntity);

 }
 class PostsLoadError extends PostsState{
  final String message;
  PostsLoadError(this.message);

 }