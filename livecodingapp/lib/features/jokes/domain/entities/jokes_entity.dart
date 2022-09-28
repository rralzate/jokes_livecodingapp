import 'package:equatable/equatable.dart';

class JokesEntity extends Equatable {
  const JokesEntity({
    required this.categories,
    required this.createdAt,
    required this.iconUrl,
    required this.id,
    required this.updatedAt,
    required this.url,
    required this.value,
    required this.existIcon,
  });

  final List<dynamic> categories;
  final DateTime createdAt;
  final String iconUrl;
  final String id;
  final DateTime updatedAt;
  final String url;
  final String value;
  final bool existIcon;

  Map<String, dynamic> toMap() => {
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "created_at": createdAt.toIso8601String(),
        "icon_url": iconUrl,
        "id": id,
        "updated_at": updatedAt.toIso8601String(),
        "url": url,
        "value": value,
      };

  @override
  List<Object?> get props => [
        categories,
        createdAt,
        iconUrl,
        id,
        updatedAt,
        url,
        value,
        existIcon,
      ];
}
