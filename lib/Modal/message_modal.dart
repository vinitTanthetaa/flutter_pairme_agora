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
  String id;
  String userId;
  String userName;
  UserImage userImage;
  int v;

  Datum({
    required this.id,
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    userId: json["user_id"],
    userName: json["user_name"],
    userImage: UserImage.fromJson(json["user_image"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "user_id": userId,
    "user_name": userName,
    "user_image": userImage.toJson(),
    "__v": v,
  };
}

class UserImage {
  String photo1;
  String photo2;

  UserImage({
    required this.photo1,
    required this.photo2,
  });

  factory UserImage.fromJson(Map<String, dynamic> json) => UserImage(
    photo1: json["photo_1"],
    photo2: json["photo_2"],
  );

  Map<String, dynamic> toJson() => {
    "photo_1": photo1,
    "photo_2": photo2,
  };
}
