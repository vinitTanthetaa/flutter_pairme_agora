// To parse this JSON data, do
//
//     final userMsgReq = userMsgReqFromJson(jsonString);

import 'dart:convert';

UserMsgReq userMsgReqFromJson(String str) => UserMsgReq.fromJson(json.decode(str));

String userMsgReqToJson(UserMsgReq data) => json.encode(data.toJson());

class UserMsgReq {
  bool? status;
  int? code;
  Data? data;

  UserMsgReq({
     this.status,
     this.code,
     this.data,
  });

  factory UserMsgReq.fromJson(Map<String, dynamic> json) => UserMsgReq(
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
  List<dynamic>? data;
  List<WithoutConnect>? withoutConnect;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
    this.userId,
    this.data,
    this.withoutConnect,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userId: json["user_id"],
    data: List<dynamic>.from(json["data"].map((x) => x)),
    withoutConnect: List<WithoutConnect>.from(json["withoutConnect"].map((x) => WithoutConnect.fromJson(x))),
    id: json["_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "data": List<dynamic>.from(data!.map((x) => x)),
    "withoutConnect": List<dynamic>.from(withoutConnect!.map((x) => x.toJson())),
    "_id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class WithoutConnect {
  String? id;
  String? userName;
  String? userImage;

  WithoutConnect({
     this.id,
     this.userName,
     this.userImage,
  });

  factory WithoutConnect.fromJson(Map<String, dynamic> json) => WithoutConnect(
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
