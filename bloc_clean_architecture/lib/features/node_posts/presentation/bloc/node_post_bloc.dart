import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/node_post_entity.dart';
import '../../domain/usecases/node_add_post_usecase.dart';
import '../../domain/usecases/node_get_post_usecase.dart';

part 'node_post_event.dart';
part 'node_post_state.dart';

class NodePostBloc extends Bloc<NodePostEvent, NodePostState> {
  final NodeGetPostUseCase getPosts;
  final NodeAddPostUseCase addPosts;
  NodePostBloc({required this.getPosts, required this.addPosts}) : super(NodePostInitial()) {
    on<GetNodePostEvent>(_getNodePost);
    on<AddNodePostEvent>(_addNodePostEvent);

  }


  FutureOr<void> _getNodePost(GetNodePostEvent event, Emitter<NodePostState> emit) async{
    emit(NodePostLoading());
    try{
      final nodePost = await getPosts.call();
      emit(NodePostLoaded(nodePost));
    } catch(e){
      emit(NodePostLoadingError());
    }
  }

  FutureOr<void> _addNodePostEvent(AddNodePostEvent event, Emitter<NodePostState> emit) async{
try{

  final NodePostEntity nodePostEntity =NodePostEntity(
    title: event.title,
    content: event.content,
    authorId: event.userId,
    imageUrl: event.imagePath,
  );
  final success = await addPosts.call(nodePostEntity);
  final nodePost = await getPosts.call();
  if(success){
    emit( NodePostLoaded(nodePost));
    print("success: $success");
  }
  else{
    emit(NodePostLoadingError());
    print("success: $success");
  }

} catch(e){
  print(e);
  emit(NodePostLoadingError());
}
  }
}
