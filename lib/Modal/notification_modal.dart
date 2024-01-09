// To parse this JSON data, do
//
//     final userNotification = userNotificationFromJson(jsonString);

import 'dart:convert';

UserNotification userNotificationFromJson(String str) => UserNotification.fromJson(json.decode(str));

String userNotificationToJson(UserNotification data) => json.encode(data.toJson());

class UserNotification {
  bool? status;
  int? code;
  List<Datum>? data;

  UserNotification({
     this.status,
     this.code,
     this.data,
  });

  factory UserNotification.fromJson(Map<String, dynamic> json) => UserNotification(
    status: json["status"],
    code: json["code"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "data": List<dynamic>.from(data?.map((x) => x.toJson()) ?? []),
  };
}

class Datum {
  String? id;
  SentBy? sentBy;
  String? receiveBy;
  String? message;
  String? time;
  String? status;
  int? v;

  Datum({
     this.id,
    this.message,
    this.time,
     this.sentBy,
     this.receiveBy,
     this.status,
     this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    sentBy: SentBy.fromJson(json["sent_by"]),
    receiveBy: json["receive_by"],
    message: json["message"],
    time: json["time"],
    status: json["status"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "sent_by": sentBy?.toJson(),
    "receive_by": receiveBy,
    "message": message,
    "time": time,
    "status": status,
    "__v": v,
  };
}

class SentBy {
  String? id;
  String? userName;
  Image? image;

  SentBy({
    this.id,
    this.userName,
    this.image,
  });

  factory SentBy.fromJson(Map<String, dynamic> json) => SentBy(
    id: json["_id"],
    userName: json["userName"],
    image: Image.fromJson(json["image"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userName": userName,
    "image": image?.toJson(),
  };
}

class Image {
  String? photo1;
  String? photo2;
  String? photo3;
  String? photo4;
  String? photo5;
  String? photo6;

  Image({
     this.photo1,
     this.photo2,
     this.photo3,
     this.photo4,
     this.photo5,
     this.photo6,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    photo1: json["photo_1"],
    photo2: json["photo_2"],
    photo3: json["photo_3"],
    photo4: json["photo_4"],
    photo5: json["photo_5"],
    photo6: json["photo_6"],
  );

  Map<String, dynamic> toJson() => {
    "photo_1": photo1,
    "photo_2": photo2,
    "photo_3": photo3,
    "photo_4": photo4,
    "photo_5": photo5,
    "photo_6": photo6,
  };
}
