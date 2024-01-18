// To parse this JSON data, do
//
//     final userMessage = userMessageFromJson(jsonString);

import 'dart:convert';

UserMessage userMessageFromJson(String str) => UserMessage.fromJson(json.decode(str));

String userMessageToJson(UserMessage data) => json.encode(data.toJson());

class UserMessage {
  bool? status;
  int? code;
  List<Datum>? data;

  UserMessage({
     this.status,
     this.code,
     this.data,
  });

  factory UserMessage.fromJson(Map<String, dynamic> json) => UserMessage(
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
  String? id;
  String? userName;
  String? userImage;

  Datum({
     this.id,
     this.userName,
     this.userImage,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    userName: json["user_name"],
    userImage: json["user_image"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "user_name": userName,
    "user_image": userImage,
  };
}
