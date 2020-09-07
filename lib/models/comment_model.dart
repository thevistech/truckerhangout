// To parse this JSON data, do
//
//     final postCommentModel = postCommentModelFromJson(jsonString);

import 'dart:convert';

SavePostModel postCommentModelFromJson(String str) => SavePostModel.fromJson(json.decode(str));

String postCommentModelToJson(SavePostModel data) => json.encode(data.toJson());

class SavePostModel {
    SavePostModel({
        this.error,
        this.code,
        this.message,
        this.noOfRecords,
        this.saveStatus,
        this.data,
    });

    String error;
    String code;
    String message;
    int noOfRecords;
    bool saveStatus;
    List<Datum> data;

    factory SavePostModel.fromJson(Map<String, dynamic> json) => SavePostModel(
        error: json["error"] == null ? null : json["error"],
        code: json["code"] == null ? null : json["code"],
        message: json["message"] == null ? null : json["message"],
        noOfRecords: json["no_of_records"] == null ? null : json["no_of_records"],
        saveStatus: json["save_status"] == null ? null : json["save_status"],
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "error": error == null ? null : error,
        "code": code == null ? null : code,
        "message": message == null ? null : message,
        "no_of_records": noOfRecords == null ? null : noOfRecords,
        "save_status": saveStatus == null ? null : saveStatus,
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.referenceId,
        this.referenceType,
        this.status,
        this.orderBy,
        this.createdByCompId,
        this.createdByUserId,
        this.userFullName,
        this.userDisplayName,
        this.userImg,
        this.userTimezone,
        this.userSlug,
        this.updatedByUserId,
        this.deletedByUserId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    String id;
    String referenceId;
    String referenceType;
    String status;
    dynamic orderBy;
    String createdByCompId;
    String createdByUserId;
    String userFullName;
    String userDisplayName;
    String userImg;
    String userTimezone;
    String userSlug;
    dynamic updatedByUserId;
    dynamic deletedByUserId;
    DateTime createdAt;
    dynamic updatedAt;
    dynamic deletedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        referenceId: json["reference_id"] == null ? null : json["reference_id"],
        referenceType: json["reference_type"] == null ? null : json["reference_type"],
        status: json["status"] == null ? null : json["status"],
        orderBy: json["order_by"],
        createdByCompId: json["created_by_comp_id"] == null ? null : json["created_by_comp_id"],
        createdByUserId: json["created_by_user_id"] == null ? null : json["created_by_user_id"],
        userFullName: json["user_full_name"] == null ? null : json["user_full_name"],
        userDisplayName: json["user_display_name"] == null ? null : json["user_display_name"],
        userImg: json["user_img"] == null ? null : json["user_img"],
        userTimezone: json["user_timezone"] == null ? null : json["user_timezone"],
        userSlug: json["user_slug"] == null ? null : json["user_slug"],
        updatedByUserId: json["updated_by_user_id"],
        deletedByUserId: json["deleted_by_user_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "reference_id": referenceId == null ? null : referenceId,
        "reference_type": referenceType == null ? null : referenceType,
        "status": status == null ? null : status,
        "order_by": orderBy,
        "created_by_comp_id": createdByCompId == null ? null : createdByCompId,
        "created_by_user_id": createdByUserId == null ? null : createdByUserId,
        "user_full_name": userFullName == null ? null : userFullName,
        "user_display_name": userDisplayName == null ? null : userDisplayName,
        "user_img": userImg == null ? null : userImg,
        "user_timezone": userTimezone == null ? null : userTimezone,
        "user_slug": userSlug == null ? null : userSlug,
        "updated_by_user_id": updatedByUserId,
        "deleted_by_user_id": deletedByUserId,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
    };
}
