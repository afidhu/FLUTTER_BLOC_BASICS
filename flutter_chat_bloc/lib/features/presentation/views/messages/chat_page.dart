import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../bloc/message_bloc/message_events.dart';
import '../../bloc/message_bloc/message_state.dart';
import '../../bloc/message_bloc/messages_blocs.dart';
import 'package:intl/intl.dart';
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
    context.read<MessagesBloc>().add(GetMessageEvent());
  }
  @override
  Widget build(BuildContext context) {
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
            Text('Afidhu euro'),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            child: BlocBuilder<MessagesBloc, MessageStates>(
              builder: (context, state) {
                if (state is LoadingMessage) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is LoadedMessage) {
                  return ListView.builder(
                    itemCount:  state.messagesModel.length,
                    itemBuilder: (context, index) {
                      var data = state.messagesModel[index];

                      return Align(
                        alignment: Alignment.centerRight,
                        child: _widgetReciverMessage(data.content.toString(), DateTime.parse(data.createdAt!)),
                      );
                    },
                  );
                } else if (state is ErrorMessage) {
                  return Center(child: Text(state.message));
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

  Widget _widgetSenderMessage() {
    return Container(
      width: Get.width * 0.5,
      child: Card(
        color: Colors.grey,
        child: Column(
          children: [
            Text(
              ' Reciever Message fsssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss',
            ),
            Text(DateTime.now().toIso8601String().substring(11, 16)),
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
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: 'Type a message',
          suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.send)),
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
