import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/posts_bloc.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PostsBloc>().add(GetPostsEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(" Post Bloc Clean Architecture"),

      ),
      body: Center(
        child: Container(
          child: BlocBuilder<PostsBloc,PostsState>(
              builder: (context, state){
                if(state is PostsLoading){
                  return const Center(child: CircularProgressIndicator(),);
                }
                else if(state is PostsLoadError) {
                  return Center(child: Text(state.message),);
                }
                else if(state is PostsLoadSuccess){
                  return ListView.builder(
                      itemCount: state.postEntity.length,
                      itemBuilder: (context, index){
                        var data = state.postEntity[index];
                        return Card(
                            child: ListTile(
                              title:Text(data.title.toString()) ,
                              leading: CircleAvatar(
                                child: Text('${index+1}'),
                              ),
                            )
                        );
                      }
                  );
                }
                return SizedBox();
              }
          ),
        ),
      ),
    );
  }
}
