// To parse this JSON data, do
//
//     final findUserStatus = findUserStatusFromJson(jsonString);

import 'dart:convert';

FindUserStatus findUserStatusFromJson(String str) => FindUserStatus.fromJson(json.decode(str));

String findUserStatusToJson(FindUserStatus data) => json.encode(data.toJson());

class FindUserStatus {
  bool? status;
  int? code;
  String? userstatus;
  List<Datum>? data;

  FindUserStatus({
     this.status,
     this.code,
     this.userstatus,
     this.data,
  });

  factory FindUserStatus.fromJson(Map<String, dynamic> json) => FindUserStatus(
    status: json["status"],
    code: json["code"],
    userstatus: json["userstatus"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "userstatus": userstatus,
    "data": List<dynamic>.from(data?.map((x) => x.toJson()) ?? []),
  };
}

class Datum {
  String? id;
  String? name;
  String? email;
  String? password;
  String? gender;
  String? dateOfBirth;
  String? countryCode;
  String? phoneNumber;
  String? language;
  String? role;
  bool? teamsAndCondition;
  int? score;
  List<ConnectedUser>? connectedUser;
  List<String>? rejectedUser;
  int? v;
  String? verified;
  Address? businessaddress;
  String? profileImage;
  List<String>? yourself;
  List<String>? lookingfor;
  String? fcm;
  Address? address;
  ProfessionalDetails? professionalDetails;
  Image? image;
  FileClass? file;
  String? userId;
  String? bio;
  String? sc;

  Datum({
    this.id,
    this.name,
    this.email,
    this.password,
    this.gender,
    this.dateOfBirth,
    this.countryCode,
    this.phoneNumber,
    this.language,
    this.role,
    this.teamsAndCondition,
    this.score,
    this.connectedUser,
    this.rejectedUser,
    this.v,
    this.verified,
    this.businessaddress,
    this.profileImage,
    this.yourself,
    this.lookingfor,
    this.fcm,
    this.address,
    this.professionalDetails,
    this.image,
    this.file,
    this.userId,
    this.bio,
    this.sc,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    password: json["password"],
    gender: json["gender"],
    dateOfBirth: json["dateOfBirth"],
    countryCode: json["countryCode"],
    phoneNumber: json["phoneNumber"],
    language: json["language"],
    role: json["role"],
    teamsAndCondition: json["teamsAndCondition"],
    score: json["score"],
    connectedUser: json["connectedUser"] == null ? [] : List<ConnectedUser>.from(json["connectedUser"]!.map((x) => ConnectedUser.fromJson(x))),
    rejectedUser: json["rejectedUser"] == null ? [] : List<String>.from(json["rejectedUser"]!.map((x) => x)),
    v: json["__v"],
    verified: json["verified"],
    businessaddress: json["businessaddress"] == null ? null : Address.fromJson(json["businessaddress"]),
    profileImage: json["profileImage"],
    yourself: json["yourself"] == null ? [] : List<String>.from(json["yourself"]!.map((x) => x)),
    lookingfor: json["lookingfor"] == null ? [] : List<String>.from(json["lookingfor"]!.map((x) => x)),
    fcm: json["fcm"],
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    professionalDetails: json["professionalDetails"] == null ? null : ProfessionalDetails.fromJson(json["professionalDetails"]),
    image: json["image"] == null ? null : Image.fromJson(json["image"]),
    file: json["file"] == null ? null : FileClass.fromJson(json["file"]),
    userId: json["user_id"],
    bio: json["bio"],
    sc: json["sc"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "password": password,
    "gender": gender,
    "dateOfBirth": dateOfBirth,
    "countryCode": countryCode,
    "phoneNumber": phoneNumber,
    "language": language,
    "role": role,
    "teamsAndCondition": teamsAndCondition,
    "score": score,
    "connectedUser": connectedUser == null ? [] : List<dynamic>.from(connectedUser!.map((x) => x.toJson())),
    "rejectedUser": rejectedUser == null ? [] : List<dynamic>.from(rejectedUser!.map((x) => x)),
    "__v": v,
    "verified": verified,
    "businessaddress": businessaddress?.toJson(),
    "profileImage": profileImage,
    "yourself": yourself == null ? [] : List<dynamic>.from(yourself!.map((x) => x)),
    "lookingfor": lookingfor == null ? [] : List<dynamic>.from(lookingfor!.map((x) => x)),
    "fcm": fcm,
    "address": address?.toJson(),
    "professionalDetails": professionalDetails?.toJson(),
    "image": image?.toJson(),
    "file": file?.toJson(),
    "user_id": userId,
    "bio": bio,
    "sc": sc,
  };
}

class Address {
  String? address;
  String? country;
  String? state;
  String? city;
  String? zipCode;
  double? latitude;
  double? longitude;
  String? sc;
  String? startdate;

  Address({
    this.address,
    this.country,
    this.state,
    this.city,
    this.zipCode,
    this.latitude,
    this.longitude,
    this.sc,
    this.startdate,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    address: json["address"],
    country: json["country"],
    state: json["state"],
    city: json["city"],
    zipCode: json["zipCode"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    sc: json["sc"],
    startdate: json["startdate"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "country": country,
    "state": state,
    "city": city,
    "zipCode": zipCode,
    "latitude": latitude,
    "longitude": longitude,
    "sc": sc,
    "startdate": startdate,
  };
}

class ConnectedUser {
  String userId;
  DateTime time;

  ConnectedUser({
    required this.userId,
    required this.time,
  });

  factory ConnectedUser.fromJson(Map<String, dynamic> json) => ConnectedUser(
    userId: json["user_id"],
    time: DateTime.parse(json["time"]),
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "time": time.toIso8601String(),
  };
}

class FileClass {
  String? file1;
  String? file2;
  String? file3;

  FileClass({
    this.file1,
    this.file2,
    this.file3,
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

class ProfessionalDetails {
  String companyName;
  String addRole;
  String companyDomain;
  String email;
  String category;
  String businessExperience;
  String skills;
  String education;
  String university;
  String sc;

  ProfessionalDetails({
    required this.companyName,
    required this.addRole,
    required this.companyDomain,
    required this.email,
    required this.category,
    required this.businessExperience,
    required this.skills,
    required this.education,
    required this.university,
    required this.sc,
  });

  factory ProfessionalDetails.fromJson(Map<String, dynamic> json) => ProfessionalDetails(
    companyName: json["company_name"],
    addRole: json["add_role"],
    companyDomain: json["company_domain"],
    email: json["email"],
    category: json["category"],
    businessExperience: json["business_experience"],
    skills: json["skills"],
    education: json["education"],
    university: json["university"],
    sc: json["sc"],
  );

  Map<String, dynamic> toJson() => {
    "company_name": companyName,
    "add_role": addRole,
    "company_domain": companyDomain,
    "email": email,
    "category": category,
    "business_experience": businessExperience,
    "skills": skills,
    "education": education,
    "university": university,
    "sc": sc,
  };
}