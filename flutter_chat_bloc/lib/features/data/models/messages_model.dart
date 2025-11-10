class MessagesModel {
  int? messageId;
  String? content;
  int? senderId;
  int? receiverId;
  String? createdAt;
  String? updatedAt;

  MessagesModel(
      {this.messageId,
        this.content,
        this.senderId,
        this.receiverId,
        this.createdAt,
        this.updatedAt});

  MessagesModel.fromJson(Map<String, dynamic> json) {
    messageId = json['message_id'];
    content = json['content'];
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message_id'] = this.messageId;
    data['content'] = this.content;
    data['senderId'] = this.senderId;
    data['receiverId'] = this.receiverId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
