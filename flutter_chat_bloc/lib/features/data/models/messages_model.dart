class MessagesModel {
  int? messageId;
  int? userId;
  String? content;
  String? createdAt;
  String? updatedAt;

  MessagesModel(
      {this.messageId,
        this.userId,
        this.content,
        this.createdAt,
        this.updatedAt});

  MessagesModel.fromJson(Map<String, dynamic> json) {
    messageId = json['message_id'];
    userId = json['userId'];
    content = json['content'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message_id'] = this.messageId;
    data['userId'] = this.userId;
    data['content'] = this.content;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
