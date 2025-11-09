
import '../../../data/models/messages_model.dart';

abstract class MessageStates{}

class InitialMessage extends MessageStates{}
class LoadingMessage extends MessageStates{}
class ErrorMessage extends MessageStates{
  final String message;

  ErrorMessage({
    required this.message,
  });
}
class LoadedMessage extends MessageStates{
  // final int message_id;
  // final int userId;
  // final String content;
  // final String createdAt;
  // final String updatedAt;
  // LoadedMessage({
  //   required this.message_id,
  //   required this.userId,
  //   required this.content,
  //   required this.createdAt,
  //   required this.updatedAt,
  // });

  List<MessagesModel> messagesModel;

  LoadedMessage({
    required this.messagesModel,
  });

}
