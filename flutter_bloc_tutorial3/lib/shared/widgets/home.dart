import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../features/post/presentation/bloc/bloc_events/post_events.dart';
import '../../features/post/presentation/bloc/bloc_logics/post_bloc_logics.dart';
import '../../features/post/presentation/bloc/bloc_states/post_states.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PostBloc>().add(FetchPosts());}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Project Structure"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){
                context.read<PostBloc>().add(PostData('title', 'content'));
              },
              icon: Icon(Icons.post_add)
          )
        ],
      ),
      body: Container(
        child: Center(
          child: BlocBuilder<PostBloc,PostState>(
              builder: (context, state){
                if(state is PostLoading){
                  return CircularProgressIndicator();
                } else if(state is PostLoaded){
                  return ListView.builder(
                    itemCount: state.posts.length,
                    itemBuilder: (context, index){
                      var data=state.posts[index];
                      return ListTile(
                        title: Text(
                          data.title,
                        ),
                        trailing:Image.network(data.imageUrl),
                      );
                    }
                      );
                } else if(state is PostLoadingError){
                  return Text(state.error);
                }
                return SizedBox.shrink();
              }
          ),
        ),
      ),
    );
  }
}
