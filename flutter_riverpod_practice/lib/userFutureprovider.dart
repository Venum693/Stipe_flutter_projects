// To parse this JSON data, do
//
//     final userinfo = userinfoFromJson(jsonString);

import 'dart:convert';

Userinfo userinfoFromJson(String str) => Userinfo.fromJson(json.decode(str));

String userinfoToJson(Userinfo data) => json.encode(data.toJson());

class Userinfo {
  String name;
  String username;
  String email;

  Userinfo({
    required this.name,
    required this.username,
    required this.email,
  });

  factory Userinfo.fromJson(Map<String, dynamic> json) => Userinfo(
    name: json["name"],
    username: json["username"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "username": username,
    "email": email,
  };
}
