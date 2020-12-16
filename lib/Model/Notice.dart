import 'dart:convert';

class Notice {
  Notice({
    this.id,
    this.title,
    this.description,
    this.content,
    this.willPublishAt,
    this.publishedAt,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String title;
  String description;
  String content;
  DateTime willPublishAt;
  DateTime publishedAt;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  factory Notice.fromRawJson(String str) => Notice.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Notice.fromJson(Map<String, dynamic> json) => Notice(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        content: json["content"] == null ? null : json["content"],
        willPublishAt: json["will_publish_at"] == null
            ? null
            : DateTime.parse(json["will_publish_at"]),
        publishedAt: json["published_at"] == null
            ? null
            : DateTime.parse(json["published_at"]),
        status: json["status"] == null ? null : json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "content": content == null ? null : content,
        "will_publish_at":
            willPublishAt == null ? null : willPublishAt.toIso8601String(),
        "published_at":
            publishedAt == null ? null : publishedAt.toIso8601String(),
        "status": status == null ? null : status,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}
