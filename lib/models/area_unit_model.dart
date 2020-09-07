import 'dart:convert';

AreaUnitModel areaUnitModelFromJson(String str) => AreaUnitModel.fromJson(json.decode(str));

String areaUnitModelToJson(AreaUnitModel data) => json.encode(data.toJson());

class AreaUnitModel {
  AreaUnitModel({
    this.error,
    this.code,
    this.message,
    this.url,
    this.noOfRecords,
    this.data,
  });

  String error;
  String code;
  String message;
  String url;
  int noOfRecords;
  List<Datum> data;

  factory AreaUnitModel.fromJson(Map<String, dynamic> json) => AreaUnitModel(
    error: json["error"],
    code: json["code"],
    message: json["message"],
    url: json["url"],
    noOfRecords: json["no_of_records"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "code": code,
    "message": message,
    "url": url,
    "no_of_records": noOfRecords,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.title,
    this.slug,
    this.code,
    this.status,
    this.orderBy,
    this.createdByCompId,
    this.createdByUserId,
    this.updatedByUserId,
    this.deletedByUserId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  String id;
  String title;
  String slug;
  String code;
  String status;
  dynamic orderBy;
  String createdByCompId;
  String createdByUserId;
  dynamic updatedByUserId;
  dynamic deletedByUserId;
  DateTime createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    slug: json["slug"],
    code: json["code"],
    status: json["status"],
    orderBy: json["order_by"],
    createdByCompId: json["created_by_comp_id"],
    createdByUserId: json["created_by_user_id"],
    updatedByUserId: json["updated_by_user_id"],
    deletedByUserId: json["deleted_by_user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "slug": slug,
    "code": code,
    "status": status,
    "order_by": orderBy,
    "created_by_comp_id": createdByCompId,
    "created_by_user_id": createdByUserId,
    "updated_by_user_id": updatedByUserId,
    "deleted_by_user_id": deletedByUserId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
  };
}
