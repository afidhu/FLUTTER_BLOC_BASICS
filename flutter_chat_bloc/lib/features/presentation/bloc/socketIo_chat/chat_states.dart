

import '../../../data/models/messages_model.dart';

abstract class ChatStates{}


class InitialChat extends ChatStates{}
class ChatLists extends ChatStates{
  final List<MessagesModel> messageList;
  ChatLists(this.messageList);
}

class UserLists extends ChatStates{
  final List<dynamic> userList;
  UserLists(this.userList);
}
