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
  String? id;
  SentBy? sentBy;
  String? receiveBy;
  String? message;
  String? time;
  int? v;

  Datum({
     this.id,
     this.sentBy,
     this.receiveBy,
     this.message,
     this.time,
     this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    sentBy: SentBy.fromJson(json["sent_by"]),
    receiveBy: json["receive_by"],
    message: json["message"],
    time: json["time"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "sent_by": sentBy?.toJson(),
    "receive_by": receiveBy,
    "message": message,
    "time": time,
    "__v": v,
  };
}

class SentBy {
  String? id;
  String? userName;
  String? image;

  SentBy({
     this.id,
     this.userName,
     this.image,
  });

  factory SentBy.fromJson(Map<String, dynamic> json) => SentBy(
    id: json["_id"],
    userName: json["userName"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userName": userName,
    "image": image,
  };
}
