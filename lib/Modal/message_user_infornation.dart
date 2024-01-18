// To parse this JSON data, do
//
//     final messageuserInfo = messageuserInfoFromJson(jsonString);

import 'dart:convert';

MessageuserInfo messageuserInfoFromJson(String str) => MessageuserInfo.fromJson(json.decode(str));

String messageuserInfoToJson(MessageuserInfo data) => json.encode(data.toJson());

class MessageuserInfo {
  bool? status;
  int? code;
  Data? data;

  MessageuserInfo({
     this.status,
     this.code,
     this.data,
  });

  factory MessageuserInfo.fromJson(Map<String, dynamic> json) => MessageuserInfo(
    status: json["status"],
    code: json["code"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "data": data?.toJson(),
  };
}

class Data {
  String? userId;
  String? userName;
  String? userImage;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
     this.userId,
     this.userName,
     this.userImage,
     this.id,
     this.createdAt,
     this.updatedAt,
     this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userId: json["user_id"],
    userName: json["user_name"],
    userImage: json["user_image"],
    id: json["_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "user_name": userName,
    "user_image": userImage,
    "_id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
