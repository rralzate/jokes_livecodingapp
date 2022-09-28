// To parse this JSON data, do
//
//     final jokes = jokesFromMap(jsonString);

import 'dart:convert';

import 'package:livecodingapp/features/jokes/domain/entities/jokes_entity.dart';

JokesModel jokesFromMap(String str) => JokesModel.fromMap(json.decode(str));

String jokesToMap(JokesModel data) => json.encode(data.toMap());

class JokesModel extends JokesEntity {
  const JokesModel({
    required List<dynamic> categories,
    required DateTime createdAt,
    required String iconUrl,
    required String id,
    required DateTime updatedAt,
    required String url,
    required String value,
    required bool existIcon,
  }) : super(
            categories: categories,
            createdAt: createdAt,
            iconUrl: iconUrl,
            id: id,
            updatedAt: createdAt,
            url: url,
            value: value,
            existIcon: existIcon);

  factory JokesModel.fromMap(Map<String, dynamic> json) => JokesModel(
        categories: List<dynamic>.from(json["categories"].map((x) => x)),
        createdAt: DateTime.parse(json["created_at"]),
        iconUrl: json["icon_url"],
        id: json["id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        url: json["url"],
        value: json["value"],
        existIcon: json["existIcon"] ?? false,
      );

  @override
  Map<String, dynamic> toMap() => {
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "created_at": createdAt.toIso8601String(),
        "icon_url": iconUrl,
        "id": id,
        "updated_at": updatedAt.toIso8601String(),
        "url": url,
        "value": value,
      };
}
