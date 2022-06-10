// To parse this JSON data, do
//
//     final dashboard = dashboardFromJson(jsonString);

import 'dart:convert';

List<Dashboard> dashboardFromJson(String str) =>
    List<Dashboard>.from(json.decode(str).map((x) => Dashboard.fromJson(x)));

String dashboardToJson(List<Dashboard> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Dashboard {
  Dashboard({
    required this.id,
    required this.title,
    required this.description,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String title;
  String description;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Dashboard.fromJson(Map<String, dynamic> json) => Dashboard(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
