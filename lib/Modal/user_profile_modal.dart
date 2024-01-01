// To parse this JSON data, do
//
//     final userProfile = userProfileFromJson(jsonString);

import 'dart:convert';

UserProfile userProfileFromJson(String str) => UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
  bool? status;
  int? code;
  String? message;
  List<Datum>? data;

  UserProfile({
     this.status,
     this.code,
     this.message,
     this.data,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
    status: json["status"],
    code: json["code"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? id;
  String? name;
  int? score;
  Address? address;
  String? companyName;
  String? addRole;
  String? businessExperience;
  String? skills;
  String? education;
  Image? image;
  FileClass? file;
  String? bio;

  Datum({
    this.id,
    this.name,
    this.score,
    this.address,
    this.companyName,
    this.addRole,
    this.businessExperience,
    this.skills,
    this.education,
    this.image,
    this.file,
    this.bio,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    name: json["name"],
    score: json["score"],
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    companyName: json["company_name"],
    addRole: json["add_role"],
    businessExperience: json["business_experience"],
    skills: json["skills"],
    education: json["education"],
    image: json["image"] == null ? null : Image.fromJson(json["image"]),
    file: json["file"] == null ? null : FileClass.fromJson(json["file"]),
    bio: json["bio"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "score": score,
    "address": address?.toJson(),
    "company_name": companyName,
    "add_role": addRole,
    "business_experience": businessExperience,
    "skills": skills,
    "education": education,
    "image": image?.toJson(),
    "file": file?.toJson(),
    "bio": bio,
  };
}

class Address {
  String address;
  String country;
  String state;
  String city;
  String zipCode;
  double latitude;
  double longitude;

  Address({
    required this.address,
    required this.country,
    required this.state,
    required this.city,
    required this.zipCode,
    required this.latitude,
    required this.longitude,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    address: json["address"],
    country: json["country"],
    state: json["state"],
    city: json["city"],
    zipCode: json["zipCode"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "country": country,
    "state": state,
    "city": city,
    "zipCode": zipCode,
    "latitude": latitude,
    "longitude": longitude,
  };
}

class FileClass {
  String file1;
  String file2;
  String file3;

  FileClass({
    required this.file1,
    required this.file2,
    required this.file3,
  });

  factory FileClass.fromJson(Map<String, dynamic> json) => FileClass(
    file1: json["file_1"],
    file2: json["file_2"],
    file3: json["file_3"],
  );

  Map<String, dynamic> toJson() => {
    "file_1": file1,
    "file_2": file2,
    "file_3": file3,
  };
}

class Image {
  String photo1;
  String photo2;
  String photo3;
  String photo4;
  String photo5;
  String photo6;

  Image({
    required this.photo1,
    required this.photo2,
    required this.photo3,
    required this.photo4,
    required this.photo5,
    required this.photo6,
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
