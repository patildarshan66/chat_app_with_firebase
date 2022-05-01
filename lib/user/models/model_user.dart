import 'dart:convert';

ModelUser modelUserFromMap(String str) => ModelUser.fromMap(json.decode(str));

String modelUserToMap(ModelUser data) => json.encode(data.toMap());

class ModelUser {
  ModelUser({
    required this.userId,
    required this.name,
    required this.email,
    this.mobileNo,
    this.profileUrl,
    // this.password,
  });

  String userId;
  String name;
  String email;
  String? mobileNo;
  String? profileUrl;
  // String? password;

  factory ModelUser.fromMap(Map<String, dynamic> json) => ModelUser(
    userId: json["user_id"] ?? '',
    name: json["name"] ?? '',
    email: json["email"] ?? '',
    mobileNo: json["mobileNo"],
    profileUrl: json["profile_url"],
    // password: json["Password"],
  );

  Map<String, dynamic> toMap() => {
    "user_id": userId,
    "name": name,
    "email": email,
    "mobileNo": mobileNo ?? "",
    "profile_url": profileUrl ?? '',
    // "Password": password ?? '',
  };
}
