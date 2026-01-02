part of 'node_post_bloc.dart';

@immutable
sealed class NodePostState extends Equatable {}

 class NodePostInitial extends NodePostState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
 class NodePostLoading extends NodePostState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
 class NodePostLoadingError extends NodePostState {
  final String error;
  NodePostLoadingError({this.error = 'Something went wrong!!!'});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

 class NodePostLoaded extends NodePostState {
  final List<NodePostEntity> nodePosts;
  NodePostLoaded(this.nodePosts);
  @override
  // TODO: implement props
  List<Object?> get props => [nodePosts];
}
