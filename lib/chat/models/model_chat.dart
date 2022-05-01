import 'package:meta/meta.dart';
import 'dart:convert';

List<ModelChat> modelChatFromMap(String str) => List<ModelChat>.from(json.decode(str).map((x) => ModelChat.fromMap(x)));

String modelChatToMap(List<ModelChat> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ModelChat {
  ModelChat({
    required this.msg,
    required this.dateTime,
    required this.isMine,
    this.isRead =false,
  });

  String msg;
  String dateTime;
  bool isMine;
  bool isRead;

  factory ModelChat.fromMap(Map<String, dynamic> json) => ModelChat(
    msg: json["msg"],
    dateTime: json["dateTime"],
    isMine: json["isMine"],
    isRead: json["isRead"],
  );

  Map<String, dynamic> toMap() => {
    "msg": msg,
    "dateTime": dateTime,
    "isMine": isMine,
    "isRead": isRead,
  };
}
