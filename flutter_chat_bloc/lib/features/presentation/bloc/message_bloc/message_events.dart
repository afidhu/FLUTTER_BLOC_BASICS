abstract class MessageEvents{}

class GetMessageEvent extends MessageEvents{

  final int user_id;
  GetMessageEvent(this.user_id);

}