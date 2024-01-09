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
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String id;
  SentBy sentBy;
  String receiveBy;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Datum({
    required this.id,
    required this.sentBy,
    required this.receiveBy,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    sentBy: SentBy.fromJson(json["sent_by"]),
    receiveBy: json["receive_by"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "sent_by": sentBy.toJson(),
    "receive_by": receiveBy,
    "status": status,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class SentBy {
  String id;
  String userName;
  Image image;

  SentBy({
    required this.id,
    required this.userName,
    required this.image,
  });

  factory SentBy.fromJson(Map<String, dynamic> json) => SentBy(
    id: json["_id"],
    userName: json["userName"],
    image: Image.fromJson(json["image"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userName": userName,
    "image": image.toJson(),
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
