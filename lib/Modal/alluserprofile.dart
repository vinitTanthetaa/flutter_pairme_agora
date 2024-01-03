// To parse this JSON data, do
//
//     final allUsersdetails = allUsersdetailsFromJson(jsonString);

import 'dart:convert';

AllUsersdetails allUsersdetailsFromJson(String str) => AllUsersdetails.fromJson(json.decode(str));

String allUsersdetailsToJson(AllUsersdetails data) => json.encode(data.toJson());

class AllUsersdetails {
  bool? status;
  int? code;
  List<List<Datum>>? data;
  List<dynamic>? rejectedData;
  List<dynamic>? connectedData;

  AllUsersdetails({
     this.status,
     this.code,
     this.data,
     this.rejectedData,
     this.connectedData,
  });

  factory AllUsersdetails.fromJson(Map<String, dynamic> json) => AllUsersdetails(
    status: json["status"],
    code: json["code"],
    data: List<List<Datum>>.from(json["data"].map((x) => List<Datum>.from(x.map((x) => Datum.fromJson(x))))),
    rejectedData: List<dynamic>.from(json["rejectedData"].map((x) => x)),
    connectedData: List<dynamic>.from(json["connectedData"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "data": List<dynamic>.from(data!.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
    "rejectedData": List<dynamic>.from(rejectedData!.map((x) => x)),
    "connectedData": List<dynamic>.from(connectedData!.map((x) => x)),
  };
}

class Datum {
  List<dynamic>? connectedUser;
  List<dynamic>? rejectedUser;
  String id;
  String? name;
  String? email;
  String? password;
  String? gender;
  String? dateOfBirth;
  int? phoneNumber;
  bool? teamsAndCondition;
  int? score;
  int v;
  String? verified;
  Address? address;
  ProfessionalDetails? professionalDetails;
  Address? businessaddress;
  List<String>? yourself;
  List<String>? lookingfor;
  Image? image;
  FileClass? file;
  String? userId;
  String? bio;

  Datum({
    this.connectedUser,
    this.rejectedUser,
    required this.id,
    this.name,
    this.email,
    this.password,
    this.gender,
    this.dateOfBirth,
    this.phoneNumber,
    this.teamsAndCondition,
    this.score,
    required this.v,
    this.verified,
    this.address,
    this.professionalDetails,
    this.businessaddress,
    this.yourself,
    this.lookingfor,
    this.image,
    this.file,
    this.userId,
    this.bio,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    connectedUser: json["connectedUser"] == null ? [] : List<dynamic>.from(json["connectedUser"]!.map((x) => x)),
    rejectedUser: json["rejectedUser"] == null ? [] : List<dynamic>.from(json["rejectedUser"]!.map((x) => x)),
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    password: json["password"],
    gender: json["gender"],
    dateOfBirth: json["dateOfBirth"],
    phoneNumber: json["phoneNumber"],
    teamsAndCondition: json["teamsAndCondition"],
    score: json["score"],
    v: json["__v"],
    verified: json["verified"],
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    professionalDetails: json["professionalDetails"] == null ? null : ProfessionalDetails.fromJson(json["professionalDetails"]),
    businessaddress: json["businessaddress"] == null ? null : Address.fromJson(json["businessaddress"]),
    yourself: json["yourself"] == null ? [] : List<String>.from(json["yourself"]!.map((x) => x)),
    lookingfor: json["lookingfor"] == null ? [] : List<String>.from(json["lookingfor"]!.map((x) => x)),
    image: json["image"] == null ? null : Image.fromJson(json["image"]),
    file: json["file"] == null ? null : FileClass.fromJson(json["file"]),
    userId: json["user_id"],
    bio: json["bio"],
  );

  Map<String, dynamic> toJson() => {
    "connectedUser": connectedUser == null ? [] : List<dynamic>.from(connectedUser!.map((x) => x)),
    "rejectedUser": rejectedUser == null ? [] : List<dynamic>.from(rejectedUser!.map((x) => x)),
    "_id": id,
    "name": name,
    "email": email,
    "password": password,
    "gender": gender,
    "dateOfBirth": dateOfBirth,
    "phoneNumber": phoneNumber,
    "teamsAndCondition": teamsAndCondition,
    "score": score,
    "__v": v,
    "verified": verified,
    "address": address?.toJson(),
    "professionalDetails": professionalDetails?.toJson(),
    "businessaddress": businessaddress?.toJson(),
    "yourself": yourself == null ? [] : List<dynamic>.from(yourself!.map((x) => x)),
    "lookingfor": lookingfor == null ? [] : List<dynamic>.from(lookingfor!.map((x) => x)),
    "image": image?.toJson(),
    "file": file?.toJson(),
    "user_id": userId,
    "bio": bio,
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
  dynamic startdate;

  Address({
     this.address,
     this.country,
     this.state,
     this.city,
     this.zipCode,
     this.latitude,
     this.longitude,
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
    "startdate": startdate,
  };
}

class FileClass {
  String? file1;
  String? file2;

  FileClass({
     this.file1,
     this.file2,
  });

  factory FileClass.fromJson(Map<String, dynamic> json) => FileClass(
    file1: json["file_1"],
    file2: json["file_2"],
  );

  Map<String, dynamic> toJson() => {
    "file_1": file1,
    "file_2": file2,
  };
}

class Image {
  String? photo1;
  String? photo2;

  Image({
     this.photo1,
     this.photo2,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    photo1: json["photo_1"],
    photo2: json["photo_2"],
  );

  Map<String, dynamic> toJson() => {
    "photo_1": photo1,
    "photo_2": photo2,
  };
}

class ProfessionalDetails {
  String? userId;
  String? companyName;
  String? addRole;
  String? companyDomain;
  String? email;
  String? category;
  String? businessExperience;
  String? skills;
  String? education;
  dynamic university;

  ProfessionalDetails({
     this.userId,
     this.companyName,
     this.addRole,
     this.companyDomain,
     this.email,
     this.category,
     this.businessExperience,
     this.skills,
     this.education,
     this.university,
  });

  factory ProfessionalDetails.fromJson(Map<String, dynamic> json) => ProfessionalDetails(
    userId: json["user_id"],
    companyName: json["company_name"],
    addRole: json["add_role"],
    companyDomain: json["company_domain"],
    email: json["email"],
    category: json["category"],
    businessExperience: json["business_experience"],
    skills: json["skills"],
    education: json["education"],
    university: json["university"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "company_name": companyName,
    "add_role": addRole,
    "company_domain": companyDomain,
    "email": email,
    "category": category,
    "business_experience": businessExperience,
    "skills": skills,
    "education": education,
    "university": university,
  };
}




// class GridItem extends StatefulWidget {
//   const GridItem({super.key});
//   @override
//   State<GridItem> createState() => _GridItemState();
// }
// class _GridItemState extends State<GridItem> {
//   final List<String> gridItems = [
//     'assets/img.png',
//     'assets/img_1.png',
//     'assets/img_2.png',
//     'assets/img_3.png',
//     'assets/img_4.png',
//     'assets/img_5.png',
//     'assets/img_6.png',
//     'assets_trip/img.png',
//     'assets_trip/img_1.png',
//     'assets_trip/img_2.png',
//     'assets_trip/img_2.png',
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('GridView Example'),
//       ),
//       body: GridView.builder(
//         itemCount: gridItems.length + 1, // Add 1 item for the grid widget
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2, // Number of columns in the grid
//         ),
//         itemBuilder: (context, index) {
//           if (index == 0) {
// // First grid item: a widget grid item
//             return const Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Card(
//                 child: Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(Icons.add, size: 40),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           "Add Story",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     )),
//               ),
//             );
//           } else {
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Card(
//                 color: Colors.blueGrey,
//                 child: Center(
//                     child: Image(
//                       image: AssetImage(gridItems[index - 1]),
//                       fit: BoxFit.cover,
//                     )),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// class SliverGrids extends StatefulWidget {
//   const SliverGrids({super.key});
//   @override
//   _HomePageState createState() => _HomePageState();
// }
// class _HomePageState extends State<SliverGrids> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
// //1
//       body: CustomScrollView(
//         slivers: <Widget>[
//           SliverAppBar(
//             expandedHeight: 400,
//             flexibleSpace: FlexibleSpaceBar(
//               title: const Text(
//                 'Goa',
//                 textScaleFactor: 2,
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               background: Image.asset(
//                 'assets_trip/img_1.png',
//                 fit: BoxFit.fill,
//               ),
//             ),
//           ),
//           SliverList(
//             delegate: SliverChildBuilderDelegate(
//                   (_, int index) {
//                 return ListTile(
//                   leading: Container(
//                       padding: const EdgeInsets.all(5),
//                       width: 100,
//                       child: const Image(
//                         image: AssetImage("assets_trip/img_2.png"),
//                         fit: BoxFit.fill,
//                       )),
//                   title: Text('Place ${index + 1}', textScaleFactor: 1.5),
//                 );
//               },
//               childCount: 20,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
