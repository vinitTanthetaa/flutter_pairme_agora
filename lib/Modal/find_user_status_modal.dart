// To parse this JSON data, do
//
//     final findUserStatus = findUserStatusFromJson(jsonString);

import 'dart:convert';

FindUserStatus findUserStatusFromJson(String str) => FindUserStatus.fromJson(json.decode(str));

String findUserStatusToJson(FindUserStatus data) => json.encode(data.toJson());

class FindUserStatus {
  bool? status;
  int? code;
  Data? data;

  FindUserStatus({
    this.status,
    this.code,
    this.data,
  });

  factory FindUserStatus.fromJson(Map<String, dynamic> json) => FindUserStatus(
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
  String id;
  String userName;
  String userImage;
  String? status;

  Data({
    required this.id,
    required this.userName,
    required this.userImage,
    this.status,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    userName: json["user_name"],
    userImage: json["user_image"],
    status: json["status"] ?? "offline"
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "user_name": userName,
    "user_image": userImage,
    "status": status ?? "offline",
  };
}
