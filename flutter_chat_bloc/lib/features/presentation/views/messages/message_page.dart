import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_bloc/core/theme_colors.dart';
import 'package:flutter_chat_bloc/features/services/app_services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../bloc/cubit_users/cubit_user_state.dart';
import '../../bloc/cubit_users/cubit_users.dart';
import '../../bloc/socketIo_chat/chat_cubit.dart';
import '../../bloc/socketIo_chat/chat_states.dart';
import 'chat_page.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final dateNow = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<UserCubit>().getAllUser();

    context.read<ChatCubit>().myConnection();
    // context.read<ChatCubit>().getOnlineUsers();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
        title: const Text(
          'Messages',
          style: TextStyle(color: AppColors.appBarTitle),
        ),
        // flexibleSpace: Container(
        //   decoration: const BoxDecoration(
        //     gradient: AppColors.appBarBackground,
        //   ),
        // ),
        // backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      body: Column(
        children: [

          // Horizontal Users List
          Text('Recent Users'),
          SizedBox(
            height: Get.height * 0.13,
            child:  BlocBuilder<ChatCubit,ChatStates> (
              builder: (context, state){
                if(state is UserLists){

                  return   ListView.builder(
                    itemCount: state.userList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:  EdgeInsets.symmetric(horizontal: Get.width * 0.01),
                        child: InkWell(
                          onTap: (){
                            // Get.to(()=>ChatPage());
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children:  [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.blueAccent,
                              ),
                              SizedBox(height: 6),
                              Text('${state.userList[index]}', style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
                return Container();
              }

            ),
          ),

          const SizedBox(height: 20),

          // Example chat list area
          _widgetUerList()
        ],
      ),
    );
  }


  Widget _widgetUerList(){
    return   Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),

        child: BlocBuilder<UserCubit,UserState>(
            builder: (context, state){
              if(state is UserInitial){
                return const Center(child: CircularProgressIndicator());
              }else if(state is LoadedUser){
                return ListView.builder(
                  itemCount:state.usersList.length,
                  itemBuilder: (context, index) {
                    var data = state.usersList[index];
                    return  InkWell(
                      onTap: (){
                        //  context.read<ChatCubit>().joinRoom(data.id.toString());
                        Get.to(()=>ChatPage(), arguments: data);
                        context.read<ChatCubit>().joinRoom(data.id!.toInt());
                      },
                      child: ListTile(
                          leading: CircleAvatar(child: Image.network('https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg', width: 20, height: 20,),),
                          title:data.id ==int.parse(AppService().getXStorage.read('userId'))?  Text('Me') : Text(data.name.toString()),
                          subtitle: Text(data.email.toString()),
                          trailing: Text(dateNow.toString().substring(11, 16))
                      ),
                    );
                  },
                );
              }
              return Container();
            }
        ),

      ),
    );
  }
}
