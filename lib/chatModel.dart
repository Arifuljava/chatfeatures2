

class ChatModel {
  int? messageId;
  int? chatId;
  String? sentBy;
  String? sentTo;
  String? message;
  String? msgType;
  String? timestmp;
  String? serverTimestmp;

  ChatModel(
      {this.messageId,
        this.chatId,
        this.sentBy,
        this.sentTo,
        this.message,
        this.msgType,
        this.timestmp,
        this.serverTimestmp});

  ChatModel.fromJson(Map<String, dynamic> json) {
    messageId = json['messageId'];
    chatId = json['chatId'];
    sentBy = json['sentBy'];
    sentTo = json['sentTo'];
    message = json['message'];
    msgType = json['msgType'];
    timestmp = json['timestmp'];
    serverTimestmp = json['server_timestmp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['messageId'] = this.messageId;
    data['chatId'] = this.chatId;
    data['sentBy'] = this.sentBy;
    data['sentTo'] = this.sentTo;
    data['message'] = this.message;
    data['msgType'] = this.msgType;
    data['timestmp'] = this.timestmp;
    data['server_timestmp'] = this.serverTimestmp;
    return data;
  }
  @override
  String toString() {
    return 'ChatModel {messageId: $messageId, chatId:'
        ' $chatId, sentBy: $sentBy, sentTo: $sentTo,'
        ' message: $message, msgType: $msgType, timestmp: $timestmp, server_timestmp: $serverTimestmp}';
  }
}
