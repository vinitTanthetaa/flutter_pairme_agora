// To parse this JSON data, do
//
//     final userMssageReq = userMssageReqFromJson(jsonString);

import 'dart:convert';

UserMssageReq userMssageReqFromJson(String str) => UserMssageReq.fromJson(json.decode(str));

String userMssageReqToJson(UserMssageReq data) => json.encode(data.toJson());

class UserMssageReq {
  bool? status;
  int? code;
  List<Datum>? data;

  UserMssageReq({
     this.status,
     this.code,
     this.data,
  });

  factory UserMssageReq.fromJson(Map<String, dynamic> json) => UserMssageReq(
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
