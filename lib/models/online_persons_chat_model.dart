// To parse this JSON data, do
//
//     final onlinePersonsChat = onlinePersonsChatFromJson(jsonString);

import 'dart:convert';

OnlinePersonsChat onlinePersonsChatFromJson(String str) => OnlinePersonsChat.fromJson(json.decode(str));

String onlinePersonsChatToJson(OnlinePersonsChat data) => json.encode(data.toJson());

class OnlinePersonsChat {
  OnlinePersonsChat({
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

  factory OnlinePersonsChat.fromJson(Map<String, dynamic> json) => OnlinePersonsChat(
    error: json["error"],
    code: json["code"],
    message: json["message"],
    url: json["url"],
    noOfRecords: json["no_of_records"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "code": code,
    "message": message,
    "url": url,
    "no_of_records": noOfRecords,
    "data": data.toJson(),
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
    currentPage: json["current_page"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    from: json["from"],
    lastPage: json["last_page"],
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "from": from,
    "last_page": lastPage,
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class Datum {
  Datum({
    this.id,
    this.receiverUserId,
    this.title,
    this.readStatus,
    this.lastConversationDate,
    this.userId,
    this.user2FullName,
    this.userDisplayName,
    this.userImg,
    this.userTimezone,
    this.userSlug,
    this.user2Id,
    this.userFullName,
    this.user2DisplayName,
    this.user2Img,
    this.user2Timezone,
    this.user2Slug,
    this.status,
    this.orderBy,
    this.createdByCompId,
    this.companyTitle,
    this.companySlug,
    this.companyLogo,
    this.companyAbout,
    this.companyVerificationStatus,
    this.companyRating,
    this.companySlogan,
    this.companyNoOfReviews,
    this.companySince,
    this.createdByUserId,
    this.updatedByUserId,
    this.deletedByUserId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  String id;
  String receiverUserId;
  dynamic title;
  dynamic readStatus;
  dynamic lastConversationDate;
  String userId;
  String user2FullName;
  String userDisplayName;
  String userImg;
  String userTimezone;
  String userSlug;
  String user2Id;
  String userFullName;
  String user2DisplayName;
  String user2Img;
  String user2Timezone;
  String user2Slug;
  String status;
  dynamic orderBy;
  String createdByCompId;
  String companyTitle;
  String companySlug;
  String companyLogo;
  String companyAbout;
  String companyVerificationStatus;
  String companyRating;
  String companySlogan;
  String companyNoOfReviews;
  dynamic companySince;
  String createdByUserId;
  dynamic updatedByUserId;
  dynamic deletedByUserId;
  DateTime createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    receiverUserId: json["receiver_user_id"],
    title: json["title"],
    readStatus: json["read_status"],
    lastConversationDate: json["last_conversation_date"],
    userId: json["user_id"],
    user2FullName: json["user2_full_name"],
    userDisplayName: json["user_display_name"],
    userImg: json["user_img"],
    userTimezone: json["user_timezone"],
    userSlug: json["user_slug"],
    user2Id: json["user2_id"],
    userFullName: json["user_full_name"],
    user2DisplayName: json["user2_display_name"],
    user2Img: json["user2_img"],
    user2Timezone: json["user2_timezone"],
    user2Slug: json["user2_slug"],
    status: json["status"],
    orderBy: json["order_by"],
    createdByCompId: json["created_by_comp_id"],
    companyTitle: json["company_title"],
    companySlug: json["company_slug"],
    companyLogo: json["company_logo"],
    companyAbout: json["company_about"],
    companyVerificationStatus: json["company_verification_status"],
    companyRating: json["company_rating"],
    companySlogan: json["company_slogan"],
    companyNoOfReviews: json["company_no_of_reviews"],
    companySince: json["company_since"],
    createdByUserId: json["created_by_user_id"],
    updatedByUserId: json["updated_by_user_id"],
    deletedByUserId: json["deleted_by_user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "receiver_user_id": receiverUserId,
    "title": title,
    "read_status": readStatus,
    "last_conversation_date": lastConversationDate,
    "user_id": userId,
    "user2_full_name": user2FullName,
    "user_display_name": userDisplayName,
    "user_img": userImg,
    "user_timezone": userTimezone,
    "user_slug": userSlug,
    "user2_id": user2Id,
    "user_full_name": userFullName,
    "user2_display_name": user2DisplayName,
    "user2_img": user2Img,
    "user2_timezone": user2Timezone,
    "user2_slug": user2Slug,
    "status": status,
    "order_by": orderBy,
    "created_by_comp_id": createdByCompId,
    "company_title": companyTitle,
    "company_slug": companySlug,
    "company_logo": companyLogo,
    "company_about": companyAbout,
    "company_verification_status": companyVerificationStatus,
    "company_rating": companyRating,
    "company_slogan": companySlogan,
    "company_no_of_reviews": companyNoOfReviews,
    "company_since": companySince,
    "created_by_user_id": createdByUserId,
    "updated_by_user_id": updatedByUserId,
    "deleted_by_user_id": deletedByUserId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
  };
}
