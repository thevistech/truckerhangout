// To parse this JSON data, do
//
//     final ChatGeneralModel = ChatGeneralModelFromJson(jsonString);

import 'dart:convert';

ChatGeneralModel ChatGeneralModelFromJson(String str) => ChatGeneralModel.fromJson(json.decode(str));

String ChatGeneralModelToJson(ChatGeneralModel data) => json.encode(data.toJson());

class ChatGeneralModel {
  ChatGeneralModel({
    this.error,
    this.code,
    this.message,
    this.url,
    this.noOfRecords,
    this.messages,
    this.stories,
    this.callLogs,
    this.users,
    this.friends,
  });

  String error;
  String code;
  String message;
  String url;
  int noOfRecords;
  List<Message> messages;
  Stories stories;
  CallLogs callLogs;
  Users users;
  Friends friends;

  factory ChatGeneralModel.fromJson(Map<String, dynamic> json) => ChatGeneralModel(
    error: json["error"],
    code: json["code"],
    message: json["message"],
    url: json["url"],
    noOfRecords: json["no_of_records"],
    messages: List<Message>.from(json["messages"].map((x) => Message.fromJson(x))),
    stories: Stories.fromJson(json["stories"]),
    callLogs: CallLogs.fromJson(json["call_logs"]),
    users: Users.fromJson(json["users"]),
    friends: Friends.fromJson(json["friends"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "code": code,
    "message": message,
    "url": url,
    "no_of_records": noOfRecords,
    "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
    "stories": stories.toJson(),
    "call_logs": callLogs.toJson(),
    "users": users.toJson(),
    "friends": friends.toJson(),
  };
}

class CallLogs {
  CallLogs({
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
  List<InfoElement> data;
  int from;
  int lastPage;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory CallLogs.fromJson(Map<String, dynamic> json) => CallLogs(
    currentPage: json["current_page"],
    data: List<InfoElement>.from(json["data"].map((x) => InfoElement.fromJson(x))),
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

class InfoElement {
  InfoElement({
    this.id,
    this.receiverUserId,
    this.type,
    this.actionStatus,
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
    this.createdByCompId,
    this.companyTitle,
    this.companySlug,
    this.companyVerificationStatus,
    this.companyRating,
    this.companyNoOfReviews,
    this.createdByUserId,
    this.createdAt,
    this.title,
    this.readStatus,
    this.lastConversationDate,
    this.orderBy,
    this.companyLogo,
    this.companyAbout,
    this.companySlogan,
  });

  String id;
  String receiverUserId;
  String type;
  String actionStatus;
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
  String createdByCompId;
  String companyTitle;
  String companySlug;
  String companyVerificationStatus;
  String companyRating;
  String companyNoOfReviews;
  String createdByUserId;
  DateTime createdAt;
  dynamic title;
  dynamic readStatus;
  dynamic lastConversationDate;
  dynamic orderBy;
  String companyLogo;
  String companyAbout;
  String companySlogan;

  factory InfoElement.fromJson(Map<String, dynamic> json) => InfoElement(
    id: json["id"],
    receiverUserId: json["receiver_user_id"],
    type: json["type"] == null ? null : json["type"],
    actionStatus: json["action_status"] == null ? null : json["action_status"],
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
    createdByCompId: json["created_by_comp_id"],
    companyTitle: json["company_title"],
    companySlug: json["company_slug"],
    companyVerificationStatus: json["company_verification_status"],
    companyRating: json["company_rating"],
    companyNoOfReviews: json["company_no_of_reviews"],
    createdByUserId: json["created_by_user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    title: json["title"],
    readStatus: json["read_status"],
    lastConversationDate: json["last_conversation_date"],
    orderBy: json["order_by"],
    companyLogo: json["company_logo"] == null ? null : json["company_logo"],
    companyAbout: json["company_about"] == null ? null : json["company_about"],
    companySlogan: json["company_slogan"] == null ? null : json["company_slogan"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "receiver_user_id": receiverUserId,
    "type": type == null ? null : type,
    "action_status": actionStatus == null ? null : actionStatus,
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
    "created_by_comp_id": createdByCompId,
    "company_title": companyTitle,
    "company_slug": companySlug,
    "company_verification_status": companyVerificationStatus,
    "company_rating": companyRating,
    "company_no_of_reviews": companyNoOfReviews,
    "created_by_user_id": createdByUserId,
    "created_at": createdAt.toIso8601String(),
    "title": title,
    "read_status": readStatus,
    "last_conversation_date": lastConversationDate,
    "order_by": orderBy,
    "company_logo": companyLogo == null ? null : companyLogo,
    "company_about": companyAbout == null ? null : companyAbout,
    "company_slogan": companySlogan == null ? null : companySlogan,
  };
}

class Friends {
  Friends({
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
  List<FriendsDatum> data;
  int from;
  int lastPage;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory Friends.fromJson(Map<String, dynamic> json) => Friends(
    currentPage: json["current_page"],
    data: List<FriendsDatum>.from(json["data"].map((x) => FriendsDatum.fromJson(x))),
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

class FriendsDatum {
  FriendsDatum({
    this.id,
    this.userId,
    this.requestStatus,
    this.userFullName,
    this.userDisplayName,
    this.userImg,
    this.userTimezone,
    this.userSlug,
    this.status,
    this.orderBy,
    this.createdByCompId,
    this.createdByUserId,
    this.updatedByUserId,
    this.deletedByUserId,
    this.createdAt,
  });

  String id;
  String userId;
  String requestStatus;
  String userFullName;
  String userDisplayName;
  String userImg;
  String userTimezone;
  String userSlug;
  String status;
  dynamic orderBy;
  String createdByCompId;
  String createdByUserId;
  dynamic updatedByUserId;
  dynamic deletedByUserId;
  DateTime createdAt;

  factory FriendsDatum.fromJson(Map<String, dynamic> json) => FriendsDatum(
    id: json["id"],
    userId: json["user_id"],
    requestStatus: json["request_status"],
    userFullName: json["user_full_name"],
    userDisplayName: json["user_display_name"],
    userImg: json["user_img"],
    userTimezone: json["user_timezone"],
    userSlug: json["user_slug"],
    status: json["status"],
    orderBy: json["order_by"],
    createdByCompId: json["created_by_comp_id"],
    createdByUserId: json["created_by_user_id"],
    updatedByUserId: json["updated_by_user_id"],
    deletedByUserId: json["deleted_by_user_id"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "request_status": requestStatus,
    "user_full_name": userFullName,
    "user_display_name": userDisplayName,
    "user_img": userImg,
    "user_timezone": userTimezone,
    "user_slug": userSlug,
    "status": status,
    "order_by": orderBy,
    "created_by_comp_id": createdByCompId,
    "created_by_user_id": createdByUserId,
    "updated_by_user_id": updatedByUserId,
    "deleted_by_user_id": deletedByUserId,
    "created_at": createdAt.toIso8601String(),
  };
}

class Message {
  Message({
    this.info,
    this.conversations,
  });

  InfoElement info;
  Conversations conversations;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    info: InfoElement.fromJson(json["info"]),
    conversations: Conversations.fromJson(json["conversations"]),
  );

  Map<String, dynamic> toJson() => {
    "info": info.toJson(),
    "conversations": conversations.toJson(),
  };
}

class Conversations {
  Conversations({
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
  List<ConversationsDatum> data;
  int from;
  int lastPage;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory Conversations.fromJson(Map<String, dynamic> json) => Conversations(
    currentPage: json["current_page"],
    data: List<ConversationsDatum>.from(json["data"].map((x) => ConversationsDatum.fromJson(x))),
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

class ConversationsDatum {
  ConversationsDatum({
    this.id,
    this.messageId,
    this.text,
    this.readStatus,
    this.userFullName,
    this.userDisplayName,
    this.userImg,
    this.userTimezone,
    this.userSlug,
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
    this.createdAt,
  });

  String id;
  String messageId;
  String text;
  dynamic readStatus;
  String userFullName;
  String userDisplayName;
  String userImg;
  String userTimezone;
  String userSlug;
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
  DateTime createdAt;

  factory ConversationsDatum.fromJson(Map<String, dynamic> json) => ConversationsDatum(
    id: json["id"],
    messageId: json["message_id"],
    text: json["text"],
    readStatus: json["read_status"],
    userFullName: json["user_full_name"],
    userDisplayName: json["user_display_name"],
    userImg: json["user_img"],
    userTimezone: json["user_timezone"],
    userSlug: json["user_slug"],
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
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "message_id": messageId,
    "text": text,
    "read_status": readStatus,
    "user_full_name": userFullName,
    "user_display_name": userDisplayName,
    "user_img": userImg,
    "user_timezone": userTimezone,
    "user_slug": userSlug,
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
    "created_at": createdAt.toIso8601String(),
  };
}

class Stories {
  Stories({
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
  List<StoriesDatum> data;
  int from;
  int lastPage;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory Stories.fromJson(Map<String, dynamic> json) => Stories(
    currentPage: json["current_page"],
    data: List<StoriesDatum>.from(json["data"].map((x) => StoriesDatum.fromJson(x))),
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

class StoriesDatum {
  StoriesDatum({
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
    this.companyLogo,
    this.companyAbout,
    this.companyVerificationStatus,
    this.companyRating,
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
  dynamic companyLogo;
  dynamic companyAbout;
  String companyVerificationStatus;
  String companyRating;
  String companyNoOfReviews;
  dynamic companySince;
  String status;
  String createdByCompId;
  String createdByUserId;
  DateTime createdAt;

  factory StoriesDatum.fromJson(Map<String, dynamic> json) => StoriesDatum(
    id: json["id"],
    privacyId: json["privacy_id"],
    description: json["description"],
    photoVideo: json["photo_video"],
    publishedAt: DateTime.parse(json["published_at"]),
    expiresAt: DateTime.parse(json["expires_at"]),
    tags: json["tags"],
    saveCount: json["save_count"],
    refreshCount: json["refresh_count"],
    imageCount: json["image_count"],
    videoCount: json["video_count"],
    fileCount: json["file_count"],
    visitor: json["visitor"],
    noOfLikes: json["no_of_likes"],
    noOfComments: json["no_of_comments"],
    noOfShare: json["no_of_share"],
    userFullName: json["user_full_name"],
    userDisplayName: json["user_display_name"],
    userImg: json["user_img"],
    userTimezone: json["user_timezone"],
    userSlug: json["user_slug"],
    companyTitle: json["company_title"],
    companySlug: json["company_slug"],
    companyLogo: json["company_logo"],
    companyAbout: json["company_about"],
    companyVerificationStatus: json["company_verification_status"],
    companyRating: json["company_rating"],
    companyNoOfReviews: json["company_no_of_reviews"],
    companySince: json["company_since"],
    status: json["status"],
    createdByCompId: json["created_by_comp_id"],
    createdByUserId: json["created_by_user_id"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "privacy_id": privacyId,
    "description": description,
    "photo_video": photoVideo,
    "published_at": publishedAt.toIso8601String(),
    "expires_at": expiresAt.toIso8601String(),
    "tags": tags,
    "save_count": saveCount,
    "refresh_count": refreshCount,
    "image_count": imageCount,
    "video_count": videoCount,
    "file_count": fileCount,
    "visitor": visitor,
    "no_of_likes": noOfLikes,
    "no_of_comments": noOfComments,
    "no_of_share": noOfShare,
    "user_full_name": userFullName,
    "user_display_name": userDisplayName,
    "user_img": userImg,
    "user_timezone": userTimezone,
    "user_slug": userSlug,
    "company_title": companyTitle,
    "company_slug": companySlug,
    "company_logo": companyLogo,
    "company_about": companyAbout,
    "company_verification_status": companyVerificationStatus,
    "company_rating": companyRating,
    "company_no_of_reviews": companyNoOfReviews,
    "company_since": companySince,
    "status": status,
    "created_by_comp_id": createdByCompId,
    "created_by_user_id": createdByUserId,
    "created_at": createdAt.toIso8601String(),
  };
}

class Users {
  Users({
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
  List<UsersDatum> data;
  int from;
  int lastPage;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    currentPage: json["current_page"],
    data: List<UsersDatum>.from(json["data"].map((x) => UsersDatum.fromJson(x))),
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

class UsersDatum {
  UsersDatum({
    this.id,
    this.compId,
    this.companyName,
    this.userLevelId,
    this.userLevelTitle,
    this.userRulGpNamId,
    this.userRulGpNamTitle,
    this.membershipId,
    this.membershipName,
    this.countryCodeId,
    this.systemUserTypeId,
    this.fullName,
    this.displayName,
    this.gender,
    this.dateOfBirth,
    this.cnicNo,
    this.username,
    this.img,
    this.signatureImage,
    this.slug,
    this.email,
    this.primaryEmailCode,
    this.primaryEmailStatus,
    this.primaryNumber,
    this.primaryNumberCode,
    this.primaryNumberStatus,
    this.password,
    this.rememberToken,
    this.liveStatus,
    this.points,
    this.about,
    this.validFrom,
    this.validTill,
    this.openingBalance,
    this.closingBalance,
    this.balanceTotal,
    this.status,
    this.orderBy,
    this.createdByCompId,
    this.createdByUserId,
    this.createdAt,
  });

  String id;
  String compId;
  String companyName;
  String userLevelId;
  String userLevelTitle;
  String userRulGpNamId;
  String userRulGpNamTitle;
  String membershipId;
  String membershipName;
  dynamic countryCodeId;
  String systemUserTypeId;
  String fullName;
  String displayName;
  dynamic gender;
  dynamic dateOfBirth;
  dynamic cnicNo;
  String username;
  String img;
  dynamic signatureImage;
  String slug;
  String email;
  String primaryEmailCode;
  String primaryEmailStatus;
  String primaryNumber;
  String primaryNumberCode;
  String primaryNumberStatus;
  String password;
  dynamic rememberToken;
  String liveStatus;
  String points;
  dynamic about;
  DateTime validFrom;
  DateTime validTill;
  String openingBalance;
  String closingBalance;
  String balanceTotal;
  String status;
  dynamic orderBy;
  String createdByCompId;
  String createdByUserId;
  DateTime createdAt;

  factory UsersDatum.fromJson(Map<String, dynamic> json) => UsersDatum(
    id: json["id"],
    compId: json["comp_id"],
    companyName: json["company_name"],
    userLevelId: json["user_level_id"],
    userLevelTitle: json["user_level_title"],
    userRulGpNamId: json["user_rul_gp_nam_id"],
    userRulGpNamTitle: json["user_rul_gp_nam_title"],
    membershipId: json["membership_id"],
    membershipName: json["membership_name"],
    countryCodeId: json["country_code_id"],
    systemUserTypeId: json["system_user_type_id"],
    fullName: json["full_name"],
    displayName: json["display_name"],
    gender: json["gender"],
    dateOfBirth: json["date_of_birth"],
    cnicNo: json["cnic_no"],
    username: json["username"],
    img: json["img"],
    signatureImage: json["signature_image"],
    slug: json["slug"],
    email: json["email"],
    primaryEmailCode: json["primary_email_code"],
    primaryEmailStatus: json["primary_email_status"],
    primaryNumber: json["primary_number"],
    primaryNumberCode: json["primary_number_code"],
    primaryNumberStatus: json["primary_number_status"],
    password: json["password"],
    rememberToken: json["remember_token"],
    liveStatus: json["live_status"],
    points: json["points"],
    about: json["about"],
    validFrom: DateTime.parse(json["valid_from"]),
    validTill: DateTime.parse(json["valid_till"]),
    openingBalance: json["opening_balance"],
    closingBalance: json["closing_balance"],
    balanceTotal: json["balance_total"],
    status: json["status"],
    orderBy: json["order_by"],
    createdByCompId: json["created_by_comp_id"],
    createdByUserId: json["created_by_user_id"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "comp_id": compId,
    "company_name": companyName,
    "user_level_id": userLevelId,
    "user_level_title": userLevelTitle,
    "user_rul_gp_nam_id": userRulGpNamId,
    "user_rul_gp_nam_title": userRulGpNamTitle,
    "membership_id": membershipId,
    "membership_name": membershipName,
    "country_code_id": countryCodeId,
    "system_user_type_id": systemUserTypeId,
    "full_name": fullName,
    "display_name": displayName,
    "gender": gender,
    "date_of_birth": dateOfBirth,
    "cnic_no": cnicNo,
    "username": username,
    "img": img,
    "signature_image": signatureImage,
    "slug": slug,
    "email": email,
    "primary_email_code": primaryEmailCode,
    "primary_email_status": primaryEmailStatus,
    "primary_number": primaryNumber,
    "primary_number_code": primaryNumberCode,
    "primary_number_status": primaryNumberStatus,
    "password": password,
    "remember_token": rememberToken,
    "live_status": liveStatus,
    "points": points,
    "about": about,
    "valid_from": validFrom.toIso8601String(),
    "valid_till": validTill.toIso8601String(),
    "opening_balance": openingBalance,
    "closing_balance": closingBalance,
    "balance_total": balanceTotal,
    "status": status,
    "order_by": orderBy,
    "created_by_comp_id": createdByCompId,
    "created_by_user_id": createdByUserId,
    "created_at": createdAt.toIso8601String(),
  };
}
