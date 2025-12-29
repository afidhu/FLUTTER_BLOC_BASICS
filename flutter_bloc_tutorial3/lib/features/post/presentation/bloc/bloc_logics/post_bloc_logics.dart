
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial3/features/post/domain/entities/post_entity.dart';
import 'package:flutter_bloc_tutorial3/features/post/domain/repository/local_post_repo.dart';
import 'package:hive/hive.dart';

import '../../../domain/repository/post_repo.dart';
import '../bloc_events/post_events.dart';
import '../bloc_states/post_states.dart';

class PostBloc extends Bloc<PostsEvents,PostState>{

  var postsBox = Hive.box('postBox');

  final LocalPostRepository localPostRepository;
  final PostRepository postRepository;

  PostBloc(this.postRepository, this.localPostRepository):super(PostInitial()){
    on<FetchPosts>(_getPosts);
    on<PostData>(_postPosts);

  }

  FutureOr<void> _getPosts(FetchPosts event, Emitter<PostState> emit)  async{
    emit(PostLoading());
    try{
      if(postsBox.isNotEmpty){
        final posts = await localPostRepository.getLocalPosts();
        emit(PostLoaded(posts));
      }
      else {
        final posts = await postRepository.getPosts();
        emit(PostLoaded(posts));
      }
    } catch(e){
      emit(PostLoadingError(e.toString()));

    }
  }

  FutureOr<void> _postPosts(PostData event, Emitter<PostState> emit)  async{

    Posts post = Posts(
        title: event.title,
        content: event.content,
        imageUrl: "https://images.unsplash.com/photo-1761839257046-84e95464cc52?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDF8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxfHx8ZW58MHx8fHx8",
        published: true,
        authorId: 2
    );
   final savedPost = await postRepository.postingPosts(post);
   print(savedPost);
   // emit(PostLoaded([savedPost]));

  }
}