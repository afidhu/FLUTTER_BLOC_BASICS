import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_bloc/features/services/app_services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/models/users_model.dart';
import '../../bloc/message_bloc/message_events.dart';
import '../../bloc/message_bloc/message_state.dart';
import '../../bloc/message_bloc/messages_blocs.dart';
import 'package:intl/intl.dart';

import '../../bloc/socketIo_chat/chat_cubit.dart';
import '../../bloc/socketIo_chat/chat_states.dart';
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // context.read<MessagesBloc>().add(GetMessageEvent(int.parse(AppService().getXStorage.read('userId'))));
    // AppService().getXStorage.read('userId')
  }

  TextEditingController messageController = TextEditingController();

   UsersModel receiverData = Get.arguments;

  @override
  Widget build(BuildContext context) {
    print('receiverId :${receiverData.id}');
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              child: Image.network(
                'https://avatars.githubusercontent.com/u/170732544?s=400&u=d1125b33dc6edb1d2b763432a7332985e53d2bc2&v=4',
                height: 20,
                width: 20,
              ),
            ),
            Text(receiverData.name.toString()),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            child: BlocBuilder<ChatCubit, ChatStates>(
              builder: (context, state) {

              if (state is ChatLists) {
                  return ListView.builder(
                    itemCount:  state.messageList.length,
                    itemBuilder: (context, index) {
                      print('messagesModel_length :${state.messageList.length}');
                      var data = state.messageList[index];

                      if(data.senderId == int.parse(AppService().getXStorage.read('userId'))){
                      return Align(
                        alignment: Alignment.centerRight,
                        child: _widgetReciverMessage(data.content.toString(), DateTime.parse(data.createdAt!)),
                      );
                    }
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: _widgetSenderMessage(data.content.toString(), DateTime.parse(data.createdAt!)),
                      );
                    },
                  );
                }
                return Container();
              },
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: _widgetContainerInput(),
          ),
        ],
      ),
    );
  }

  Widget _widgetSenderMessage(String message, DateTime time) {
    return Container(
      width: Get.width * 0.5,
      child: Card(
        color: Colors.grey,
        child: Column(
          children: [
            Text(
              message,
            ),
            Text(DateFormat('dd/MM/yyyy').format(time)),
          ],
        ),
      ),
    );
  }

  Widget _widgetReciverMessage(String message, DateTime time) {
    return Container(
      width: Get.width * 0.5,
      child: Card(
        color: Colors.grey,
        child: Column(
          children: [
            Text(
              message,
            ),
            Text(DateFormat('dd/MM/yyyy').format(time)),
          ],
        ),
      ),
    );
  }

  Widget _widgetContainerInput() {
    return Container(

      child: TextFormField(
        controller: messageController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: 'Type a message',
          suffixIcon: IconButton(onPressed: () {
            context.read<ChatCubit>().sendMessage(messageController.text, receiverData.id!.toInt());
           messageController.clear() ;
          }, icon: Icon(Icons.send)),
        ),
      ),
    );
  }
}

// (
// children: [
// Align(
// alignment: Alignment.centerRight,
// child: _widgetReciverMessage(),
// ),
// Align(
// alignment: Alignment.centerLeft,
// child: _widgetSenderMessage(),
// ),
// ],
// ),
