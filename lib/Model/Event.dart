// To parse this JSON data, do
//
//     final event = eventFromJson(jsonString);

import 'dart:convert';

class Event {
  Event({
    this.id,
    this.title1,
    this.title2,
    this.title3,
    this.description,
    this.joinCondition,
    this.holdingArea,
    this.maleAgeFrom,
    this.maleAgeTo,
    this.maleOriginPrice,
    this.maleSalePrice,
    this.maleAcceptanceStatus,
    this.femaleAgeFrom,
    this.femaleAgeTo,
    this.femaleOriginPrice,
    this.femaleSalePrice,
    this.femaleAcceptanceStatus,
    this.startAt,
    this.endAt,
    this.iconPath,
    this.width,
    this.height,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String title1;
  String title2;
  String title3;
  String description;
  String joinCondition;
  String holdingArea;
  int maleAgeFrom;
  int maleAgeTo;
  int maleOriginPrice;
  int maleSalePrice;
  List<AcceptanceStatus> maleAcceptanceStatus;
  int femaleAgeFrom;
  int femaleAgeTo;
  int femaleOriginPrice;
  int femaleSalePrice;
  List<AcceptanceStatus> femaleAcceptanceStatus;
  DateTime startAt;
  DateTime endAt;
  String iconPath;
  int width;
  int height;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  factory Event.fromRawJson(String str) => Event.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"] == null ? null : json["id"],
        title1: json["title1"] == null ? "" : json["title1"],
        title2: json["title2"] == null ? "" : json["title2"],
        title3: json["title3"] == null ? "" : json["title3"],
        description: json["description"] == null ? "" : json["description"],
        joinCondition:
            json["join_condition"] == null ? "" : json["join_condition"],
        holdingArea: json["holding_area"] == null ? "" : json["holding_area"],
        maleAgeFrom:
            json["male_age_from"] == null ? null : json["male_age_from"],
        maleAgeTo: json["male_age_to"] == null ? null : json["male_age_to"],
        maleOriginPrice: json["male_origin_price"] == null
            ? null
            : json["male_origin_price"],
        maleSalePrice:
            json["male_sale_price"] == null ? null : json["male_sale_price"],
        maleAcceptanceStatus: json["male_acceptance_status"] == null
            ? null
            : List<AcceptanceStatus>.from(json["male_acceptance_status"]
                .map((x) => AcceptanceStatus.fromJson(x))),
        femaleAgeFrom:
            json["female_age_from"] == null ? null : json["female_age_from"],
        femaleAgeTo:
            json["female_age_to"] == null ? null : json["female_age_to"],
        femaleOriginPrice: json["female_origin_price"] == null
            ? null
            : json["female_origin_price"],
        femaleSalePrice: json["female_sale_price"] == null
            ? null
            : json["female_sale_price"],
        femaleAcceptanceStatus: json["female_acceptance_status"] == null
            ? null
            : List<AcceptanceStatus>.from(json["female_acceptance_status"]
                .map((x) => AcceptanceStatus.fromJson(x))),
        startAt:
            json["start_at"] == null ? null : DateTime.parse(json["start_at"]),
        endAt: json["end_at"] == null ? null : DateTime.parse(json["end_at"]),
        iconPath: json["icon_path"] == null ? "" : json["icon_path"],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
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
        "title1": title1 == null ? null : title1,
        "title2": title2 == null ? null : title2,
        "title3": title3 == null ? null : title3,
        "description": description == null ? null : description,
        "join_condition": joinCondition == null ? null : joinCondition,
        "holding_area": holdingArea == null ? null : holdingArea,
        "male_age_from": maleAgeFrom == null ? null : maleAgeFrom,
        "male_age_to": maleAgeTo == null ? null : maleAgeTo,
        "male_origin_price": maleOriginPrice == null ? null : maleOriginPrice,
        "male_sale_price": maleSalePrice == null ? null : maleSalePrice,
        "male_acceptance_status": maleAcceptanceStatus == null
            ? null
            : List<dynamic>.from(maleAcceptanceStatus.map((x) => x.toJson())),
        "female_age_from": femaleAgeFrom == null ? null : femaleAgeFrom,
        "female_age_to": femaleAgeTo == null ? null : femaleAgeTo,
        "female_origin_price":
            femaleOriginPrice == null ? null : femaleOriginPrice,
        "female_sale_price": femaleSalePrice == null ? null : femaleSalePrice,
        "female_acceptance_status": femaleAcceptanceStatus == null
            ? null
            : List<dynamic>.from(femaleAcceptanceStatus.map((x) => x.toJson())),
        "start_at": startAt == null ? null : startAt.toIso8601String(),
        "end_at": endAt == null ? null : endAt.toIso8601String(),
        "icon_path": iconPath == null ? null : iconPath,
        "width": width == null ? null : width,
        "height": height == null ? null : height,
        "status": status == null ? null : status,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}

class AcceptanceStatus {
  AcceptanceStatus({
    this.id,
    this.jp,
  });

  int id;
  Jp jp;

  factory AcceptanceStatus.fromRawJson(String str) =>
      AcceptanceStatus.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AcceptanceStatus.fromJson(Map<String, dynamic> json) =>
      AcceptanceStatus(
        id: json["id"] == null ? null : json["id"],
        jp: json["jp"] == null ? null : jpValues.map[json["jp"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "jp": jp == null ? null : jpValues.reverse[jp],
      };
}

enum Jp { EMPTY, JP, PURPLE, FLUFFY }

final jpValues = EnumValues(
    {"完売": Jp.EMPTY, "男性急募‼": Jp.FLUFFY, "受付中": Jp.JP, "女性急募‼": Jp.PURPLE});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
