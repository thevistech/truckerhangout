// To parse this JSON data, do
//
//     final storiesModel = storiesModelFromJson(jsonString);

import 'dart:convert';

StoriesModel storiesModelFromJson(String str) => StoriesModel.fromJson(json.decode(str));

String storiesModelToJson(StoriesModel data) => json.encode(data.toJson());

class StoriesModel {
    StoriesModel({
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
    Data data;

    factory StoriesModel.fromJson(Map<String, dynamic> json) => StoriesModel(
        error: json["error"] == null ? null : json["error"],
        code: json["code"] == null ? null : json["code"],
        message: json["message"] == null ? null : json["message"],
        url: json["url"] == null ? null : json["url"],
        noOfRecords: json["no_of_records"] == null ? null : json["no_of_records"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "error": error == null ? null : error,
        "code": code == null ? null : code,
        "message": message == null ? null : message,
        "url": url == null ? null : url,
        "no_of_records": noOfRecords == null ? null : noOfRecords,
        "data": data == null ? null : data.toJson(),
    };
}

class Data {
    Data({
        this.currentPage,
        this.data,
        this.from,
        this.lastPage,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total,
    });

    int currentPage;
    List<Datum> data;
    int from;
    int lastPage;
    dynamic nextPageUrl;
    String path;
    int perPage;
    dynamic prevPageUrl;
    int to;
    int total;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"] == null ? null : json["current_page"],
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        from: json["from"] == null ? null : json["from"],
        lastPage: json["last_page"] == null ? null : json["last_page"],
        nextPageUrl: json["next_page_url"],
        path: json["path"] == null ? null : json["path"],
        perPage: json["per_page"] == null ? null : json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"] == null ? null : json["to"],
        total: json["total"] == null ? null : json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage == null ? null : currentPage,
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
        "from": from == null ? null : from,
        "last_page": lastPage == null ? null : lastPage,
        "next_page_url": nextPageUrl,
        "path": path == null ? null : path,
        "per_page": perPage == null ? null : perPage,
        "prev_page_url": prevPageUrl,
        "to": to == null ? null : to,
        "total": total == null ? null : total,
    };
}

class Datum {
    Datum({
        this.id,
        this.privacyId,
        this.description,
        this.photoVideo,
        this.publishedAt,
        this.expiresAt,
        this.tags,
        this.saveCount,
        this.refreshCount,
        this.imageCount,
        this.videoCount,
        this.fileCount,
        this.visitor,
        this.noOfLikes,
        this.noOfComments,
        this.noOfShare,
        this.userFullName,
        this.userDisplayName,
        this.userImg,
        this.userTimezone,
        this.userSlug,
        this.companyTitle,
        this.companySlug,
        this.companyVerificationStatus,
        this.companyRating,
        this.companySlogan,
        this.companyNoOfReviews,
        this.companySince,
        this.status,
        this.createdByCompId,
        this.createdByUserId,
        this.createdAt,
    });

    String id;
    String privacyId;
    String description;
    String photoVideo;
    DateTime publishedAt;
    DateTime expiresAt;
    dynamic tags;
    String saveCount;
    String refreshCount;
    String imageCount;
    String videoCount;
    String fileCount;
    String visitor;
    String noOfLikes;
    String noOfComments;
    String noOfShare;
    String userFullName;
    String userDisplayName;
    String userImg;
    String userTimezone;
    String userSlug;
    String companyTitle;
    String companySlug;
    String companyVerificationStatus;
    String companyRating;
    dynamic companySlogan;
    String companyNoOfReviews;
    dynamic companySince;
    String status;
    String createdByCompId;
    String createdByUserId;
    DateTime createdAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        privacyId: json["privacy_id"] == null ? null : json["privacy_id"],
        description: json["description"] == null ? null : json["description"],
        photoVideo: json["photo_video"] == null ? null : json["photo_video"],
        publishedAt: json["published_at"] == null ? null : DateTime.parse(json["published_at"]),
        expiresAt: json["expires_at"] == null ? null : DateTime.parse(json["expires_at"]),
        tags: json["tags"],
        saveCount: json["save_count"] == null ? null : json["save_count"],
        refreshCount: json["refresh_count"] == null ? null : json["refresh_count"],
        imageCount: json["image_count"] == null ? null : json["image_count"],
        videoCount: json["video_count"] == null ? null : json["video_count"],
        fileCount: json["file_count"] == null ? null : json["file_count"],
        visitor: json["visitor"] == null ? null : json["visitor"],
        noOfLikes: json["no_of_likes"] == null ? null : json["no_of_likes"],
        noOfComments: json["no_of_comments"] == null ? null : json["no_of_comments"],
        noOfShare: json["no_of_share"] == null ? null : json["no_of_share"],
        userFullName: json["user_full_name"] == null ? null : json["user_full_name"],
        userDisplayName: json["user_display_name"] == null ? null : json["user_display_name"],
        userImg: json["user_img"] == null ? null : json["user_img"],
        userTimezone: json["user_timezone"] == null ? null : json["user_timezone"],
        userSlug: json["user_slug"] == null ? null : json["user_slug"],
        companyTitle: json["company_title"] == null ? null : json["company_title"],
        companySlug: json["company_slug"] == null ? null : json["company_slug"],
        companyVerificationStatus: json["company_verification_status"] == null ? null : json["company_verification_status"],
        companyRating: json["company_rating"] == null ? null : json["company_rating"],
        companySlogan: json["company_slogan"],
        companyNoOfReviews: json["company_no_of_reviews"] == null ? null : json["company_no_of_reviews"],
        companySince: json["company_since"],
        status: json["status"] == null ? null : json["status"],
        createdByCompId: json["created_by_comp_id"] == null ? null : json["created_by_comp_id"],
        createdByUserId: json["created_by_user_id"] == null ? null : json["created_by_user_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "privacy_id": privacyId == null ? null : privacyId,
        "description": description == null ? null : description,
        "photo_video": photoVideo == null ? null : photoVideo,
        "published_at": publishedAt == null ? null : publishedAt.toIso8601String(),
        "expires_at": expiresAt == null ? null : expiresAt.toIso8601String(),
        "tags": tags,
        "save_count": saveCount == null ? null : saveCount,
        "refresh_count": refreshCount == null ? null : refreshCount,
        "image_count": imageCount == null ? null : imageCount,
        "video_count": videoCount == null ? null : videoCount,
        "file_count": fileCount == null ? null : fileCount,
        "visitor": visitor == null ? null : visitor,
        "no_of_likes": noOfLikes == null ? null : noOfLikes,
        "no_of_comments": noOfComments == null ? null : noOfComments,
        "no_of_share": noOfShare == null ? null : noOfShare,
        "user_full_name": userFullName == null ? null : userFullName,
        "user_display_name": userDisplayName == null ? null : userDisplayName,
        "user_img": userImg == null ? null : userImg,
        "user_timezone": userTimezone == null ? null : userTimezone,
        "user_slug": userSlug == null ? null : userSlug,
        "company_title": companyTitle == null ? null : companyTitle,
        "company_slug": companySlug == null ? null : companySlug,
        "company_verification_status": companyVerificationStatus == null ? null : companyVerificationStatus,
        "company_rating": companyRating == null ? null : companyRating,
        "company_slogan": companySlogan,
        "company_no_of_reviews": companyNoOfReviews == null ? null : companyNoOfReviews,
        "company_since": companySince,
        "status": status == null ? null : status,
        "created_by_comp_id": createdByCompId == null ? null : createdByCompId,
        "created_by_user_id": createdByUserId == null ? null : createdByUserId,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    };
}
