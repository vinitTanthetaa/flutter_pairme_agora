// To parse this JSON data, do
//
//     final chatData = chatDataFromJson(jsonString);

import 'dart:convert';

ChatData chatDataFromJson(String str) => ChatData.fromJson(json.decode(str));

String chatDataToJson(ChatData data) => json.encode(data.toJson());

class ChatData {
  bool? status;
  int? code;
  List<Datum>? data;

  ChatData({
     this.status,
     this.code,
     this.data,
  });

  factory ChatData.fromJson(Map<String, dynamic> json) => ChatData(
    status: json["status"],
    code: json["code"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? from;
  String? to;
  Body? body;
  String? direction;
  bool? hasRead;
  bool? hasReadAck;
  bool? hasDeliverAck;
  bool? needGroupAck;
  String? msgId;
  String? conversationId;
  int? chatType;
  int? localTime;
  int? serverTime;
  int? status;
  bool? isThread;
  bool? deliverOnlineOnly;

  Datum({
     this.from,
     this.to,
     this.body,
     this.direction,
     this.hasRead,
     this.hasReadAck,
     this.hasDeliverAck,
     this.needGroupAck,
     this.msgId,
     this.conversationId,
     this.chatType,
     this.localTime,
     this.serverTime,
     this.status,
     this.isThread,
     this.deliverOnlineOnly,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    from: json["from"],
    to: json["to"],
    body: Body.fromJson(json["body"]),
    direction: json["direction"],
    hasRead: json["hasRead"],
    hasReadAck: json["hasReadAck"],
    hasDeliverAck: json["hasDeliverAck"],
    needGroupAck: json["needGroupAck"],
    msgId: json["msgId"],
    conversationId: json["conversationId"],
    chatType: json["chatType"],
    localTime: json["localTime"],
    serverTime: json["serverTime"],
    status: json["status"],
    isThread: json["isThread"],
    deliverOnlineOnly: json["deliverOnlineOnly"],
  );

  Map<String, dynamic> toJson() => {
    "from": from,
    "to": to,
    "body": body?.toJson(),
    "direction": direction,
    "hasRead": hasRead,
    "hasReadAck": hasReadAck,
    "hasDeliverAck": hasDeliverAck,
    "needGroupAck": needGroupAck,
    "msgId": msgId,
    "conversationId": conversationId,
    "chatType": chatType,
    "localTime": localTime,
    "serverTime": serverTime,
    "status": status,
    "isThread": isThread,
    "deliverOnlineOnly": deliverOnlineOnly,
  };
}

class Body {
  String? type;
  String? content;
  Translations? translations;

  Body({
     this.type,
     this.content,
     this.translations,
  });

  factory Body.fromJson(Map<String, dynamic> json) => Body(
    type: json["type"],
    content: json["content"],
    translations: json["translations"] == null ? null: Translations.fromJson(json["translations"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "content": content,
    "translations": translations?.toJson(),
  };
}

class Translations {
  Translations();

  factory Translations.fromJson(Map<String, dynamic> json) => Translations(
  );

  Map<String, dynamic> toJson() => {
  };
}
