// To parse this JSON data, do
//
//     final toggleFollowUnFollow = toggleFollowUnFollowFromJson(jsonString);

import 'dart:convert';

ToggleFollowUnFollow toggleFollowUnFollowFromJson(String str) => ToggleFollowUnFollow.fromJson(json.decode(str));

String toggleFollowUnFollowToJson(ToggleFollowUnFollow data) => json.encode(data.toJson());

class ToggleFollowUnFollow {
    ToggleFollowUnFollow({
        this.error,
        this.code,
        this.message,
        this.noOfFollowing,
        this.followStatus,
        this.data,
    });

    String error;
    String code;
    String message;
    int noOfFollowing;
    bool followStatus;
    List<Datum> data;

    factory ToggleFollowUnFollow.fromJson(Map<String, dynamic> json) => ToggleFollowUnFollow(
        error: json["error"] == null ? null : json["error"],
        code: json["code"] == null ? null : json["code"],
        message: json["message"] == null ? null : json["message"],
        noOfFollowing: json["no_of_following"] == null ? null : json["no_of_following"],
        followStatus: json["follow_status"] == null ? null : json["follow_status"],
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "error": error == null ? null : error,
        "code": code == null ? null : code,
        "message": message == null ? null : message,
        "no_of_following": noOfFollowing == null ? null : noOfFollowing,
        "follow_status": followStatus == null ? null : followStatus,
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.followedToId,
        this.followedType,
        this.actionStatus,
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
    String followedToId;
    String followedType;
    dynamic actionStatus;
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
        id: json["id"] == null ? null : json["id"],
        followedToId: json["followed_to_id"] == null ? null : json["followed_to_id"],
        followedType: json["followed_type"] == null ? null : json["followed_type"],
        actionStatus: json["action_status"],
        status: json["status"] == null ? null : json["status"],
        orderBy: json["order_by"],
        createdByCompId: json["created_by_comp_id"] == null ? null : json["created_by_comp_id"],
        createdByUserId: json["created_by_user_id"] == null ? null : json["created_by_user_id"],
        updatedByUserId: json["updated_by_user_id"],
        deletedByUserId: json["deleted_by_user_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "followed_to_id": followedToId == null ? null : followedToId,
        "followed_type": followedType == null ? null : followedType,
        "action_status": actionStatus,
        "status": status == null ? null : status,
        "order_by": orderBy,
        "created_by_comp_id": createdByCompId == null ? null : createdByCompId,
        "created_by_user_id": createdByUserId == null ? null : createdByUserId,
        "updated_by_user_id": updatedByUserId,
        "deleted_by_user_id": deletedByUserId,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
    };
}
