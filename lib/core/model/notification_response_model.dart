// ignore_for_file: constant_identifier_names

import 'dart:convert';

NotificationResponseModel notificationResponseModelFromJson(String str) =>
    NotificationResponseModel.fromJson(json.decode(str));

String notificationResponseModelToJson(NotificationResponseModel data) =>
    json.encode(data.toJson());

class NotificationResponseModel {
  NotificationResponseModel({
    required this.message,
    required this.data,
    required this.success,
  });

  String message;
  List<Data> data;
  bool success;

  factory NotificationResponseModel.fromJson(Map<String, dynamic> json) =>
      NotificationResponseModel(
        message: json["message"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "success": success,
      };
}

class Data {
  Data({
    required this.image,
    required this.title,
    required this.body,
    required this.timestamp,
  });

  String image;
  String title;
  String body;
  DateTime timestamp;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        image: json["image"],
        title: json["title"],
        body: json["body"],
        timestamp: DateTime.parse(json["timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "body": body,
        "timestamp": timestamp.toIso8601String(),
      };
}
