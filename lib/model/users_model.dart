// To parse this JSON data, do
//
//     final usersModel = usersModelFromJson(jsonString);

import 'dart:convert';

List<UsersModel> usersModelFromJson(String str) => List<UsersModel>.from(json.decode(str).map((x) => UsersModel.fromJson(x)));

String usersModelToJson(List<UsersModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UsersModel {
    int id;
    String username;
    String password;
    String email;
    String? profilePicturePath;
    String? fullname;
    String? salt;

    UsersModel({
        required this.id,
        required this.username,
        required this.password,
        required this.email,
        required this.profilePicturePath,
        required this.fullname,
        required this.salt,
    });

    factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        id: json["id"],
        username: json["username"],
        password: json["password"],
        email: json["email"],
        profilePicturePath: json["profile_picture_path"],
        fullname: json["fullname"],
        salt: json["salt"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "password": password,
        "email": email,
        "profile_picture_path": profilePicturePath,
        "fullname": fullname,
        "salt": salt,
    };
}
