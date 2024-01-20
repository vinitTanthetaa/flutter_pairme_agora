// To parse this JSON data, do
//
//     final userMessage = userMessageFromJson(jsonString);

import 'dart:convert';

UserMessage userMessageFromJson(String str) => UserMessage.fromJson(json.decode(str));

String userMessageToJson(UserMessage data) => json.encode(data.toJson());

class UserMessage {
  bool? status;
  int? code;
  Data? data;

  UserMessage({
     this.status,
     this.code,
     this.data,
  });

  factory UserMessage.fromJson(Map<String, dynamic> json) => UserMessage(
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
  String? id;
  String? userId;
  List<Datum>? data;
  List<dynamic>? withoutConnect;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
     this.id,
     this.userId,
     this.data,
     this.withoutConnect,
     this.createdAt,
     this.updatedAt,
     this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    userId: json["user_id"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    withoutConnect: List<dynamic>.from(json["withoutConnect"].map((x) => x)),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "user_id": userId,
    "data": List<dynamic>.from(data?.map((x) => x.toJson()) ?? []),
    "withoutConnect": List<dynamic>.from(withoutConnect?.map((x) => x) ?? []),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
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
