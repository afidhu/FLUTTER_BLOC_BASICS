import 'package:flutter_chat_bloc/features/data/datasource/auth_datasource.dart';
import 'package:flutter_chat_bloc/features/presentation/bloc/message_bloc/message_events.dart';
import 'package:flutter_chat_bloc/features/presentation/bloc/message_bloc/messages_blocs.dart';
import 'package:flutter_chat_bloc/features/services/app_services.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;


import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/messages_model.dart';
import '../../../domain/repositories/message_repository.dart';
import 'chat_states.dart';

class ChatCubit extends Cubit<ChatStates>{
  ChatCubit() : super(InitialChat());
  List<MessagesModel> messagesDataList = [];
  List<String> onlineUsers = [];

  IO.Socket? socket;
  void myConnection(){
    socket  = IO.io('http://192.168.1.133:5000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket?.onConnect((_){
      print('ok fine connected');
      socket!.on('me', (data){

        print('usersId : $data');
      });
      // socket!.on('users', (data){
      //   print('users are: $data');
      // });
    });
    socket!.connect();
    getOnlineUsers();
    getMessages();
    socket!.on('disconnect', (_) => print('disconnect'));
  }

  void getOnlineUsers(){
    socket!.on('users', (data){
      print('users are: $data');
      onlineUsers.addAll(data.map<String>((json) => json.toString()).toList());
      emit(UserLists(onlineUsers));
      print('users are: $data');
    });
  }

  void getMessages(){
    socket!.on('get_messages',(data){

      List<MessagesModel> messagess = data.map<MessagesModel>((json) => MessagesModel.fromJson(json)).toList();
      messagesDataList.addAll(messagess);
      emit(ChatLists(messagesDataList));
    });
  }


void sendMessage(String message, int receiverId){
    socket!.emit('send_messages',{"content":message, "senderId":AppService().getXStorage.read('userId'), "receiverId":receiverId});

}

void joinRoom( int receiverId){
  socket?.emit('join_room',({'room':receiverId}));
}




}

