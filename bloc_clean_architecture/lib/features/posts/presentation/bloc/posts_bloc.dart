import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_clean_architecture/features/posts/data/data_source/remote/poduct_remote_data.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/posts_entity.dart';
import '../../domain/usecases/get_post_usecase.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {

  final GetPostUseCase _getPostUseCase;

  PostsBloc(this._getPostUseCase) : super(PostsInitial()) {
    on<GetPostsEvent>(_getPost);

  }


  FutureOr<void> _getPost(GetPostsEvent event, Emitter<PostsState> emit)  async{
    emit(PostsLoading());

 try{

   final List<PostEntity> posts = await _getPostUseCase.call();
   // print(posts);
   emit(PostsLoadSuccess(posts));
 } catch(e){
   emit(PostsLoadError(e.toString()));
 }

  }
}
