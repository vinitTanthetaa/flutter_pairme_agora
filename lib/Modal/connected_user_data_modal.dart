// To parse this JSON data, do
//
//     final connectedUsers = connectedUsersFromJson(jsonString);

import 'dart:convert';

ConnectedUsers connectedUsersFromJson(String str) => ConnectedUsers.fromJson(json.decode(str));

String connectedUsersToJson(ConnectedUsers data) => json.encode(data.toJson());

class ConnectedUsers {
  bool? status;
  int? code;
  List<Datum>? data;

  ConnectedUsers({
     this.status,
     this.code,
     this.data,
  });

  factory ConnectedUsers.fromJson(Map<String, dynamic> json) => ConnectedUsers(
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
  String? name;
  String? profileImage;
  DateTime? time;

  Datum({
     this.id,
     this.name,
     this.profileImage,
     this.time,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    name: json["name"],
    profileImage: json["profileImage"],
    time: DateTime.parse(json["time"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "profileImage": profileImage,
    "time": time?.toIso8601String(),
  };
}
