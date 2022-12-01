// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) =>
    json.encode(data.toJson(data.userId!));

class UserModel {
  UserModel({
    this.userId,
    this.name,
    this.email,
    this.phoneNumber,
    this.image,
    this.address,
  });

  String? userId;
  String? name;
  String? email;
  String? phoneNumber;
  String? image;
  String? address;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["userId"],
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        image: json["image"],
        address: json["address"],
      );

  Map<String, dynamic> toJson(String docID) => {
        "userId": docID,
        "name": name,
        "email": email,
        "phoneNumber": phoneNumber,
        "image": image,
        "address": address,
      };
}
