// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  PostModel({
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

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        error: json["error"] == null ? null : json["error"],
        code: json["code"] == null ? null : json["code"],
        message: json["message"] == null ? null : json["message"],
        url: json["url"] == null ? null : json["url"],
        noOfRecords:
            json["no_of_records"] == null ? null : json["no_of_records"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error == null ? null : error,
        "code": code == null ? null : code,
        "message": message == null ? null : message,
        "url": url == null ? null : url,
        "no_of_records": noOfRecords == null ? null : noOfRecords,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.info,
    this.phone,
    this.email,
    this.address,
    this.seo,
    this.log,
    this.gallery,
    this.video,
    this.likes,
    this.comments,
    this.externalLink,
    this.attachment,
    this.saves,
    //this.rating,
    this.company,
    this.user,
  });

  Info info;
  List<dynamic> phone;
  List<dynamic> email;
  List<Address> address;
  List<dynamic> seo;
  List<dynamic> log;
  List<dynamic> gallery;
  List<dynamic> video;
  List<LikeAndComment> likes;
  List<LikeAndComment> comments;
  List<dynamic> externalLink;
  List<dynamic> attachment;
  List<Save> saves;
  //List<dynamic> rating;
  Map<String, String> company;
  User user;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        info: json["info"] == null ? null : Info.fromJson(json["info"]),
        phone: json["phone"] == null
            ? null
            : List<dynamic>.from(json["phone"].map((x) => x)),
        email: json["email"] == null
            ? null
            : List<dynamic>.from(json["email"].map((x) => x)),
        address: json["address"] == null
            ? null
            : List<Address>.from(
                json["address"].map((x) => Address.fromJson(x))),
        saves: json["saves"] == null
            ? null
            : List<Save>.from(json["saves"].map((x) => Save.fromJson(x))),
        seo: json["seo"] == null
            ? null
            : List<dynamic>.from(json["seo"].map((x) => x)),
        log: json["log"] == null
            ? null
            : List<dynamic>.from(json["log"].map((x) => x)),
        gallery: json["gallery"] == null
            ? null
            : List<dynamic>.from(json["gallery"].map((x) => x)),
        video: json["video"] == null
            ? null
            : List<dynamic>.from(json["video"].map((x) => x)),
        likes: json["likes"] == null
            ? null
            : List<LikeAndComment>.from(
                json["likes"].map((x) => LikeAndComment.fromJson(x))),
        comments: json["comments"] == null
            ? null
            : List<LikeAndComment>.from(
                json["comments"].map((x) => LikeAndComment.fromJson(x))),
        externalLink: json["external_link"] == null
            ? null
            : List<dynamic>.from(json["external_link"].map((x) => x)),
        attachment: json["attachment"] == null
            ? null
            : List<dynamic>.from(json["attachment"].map((x) => x)),
        //rating: json["rating"] == null ? null : List<dynamic>.from(json["rating"].map((x) => x)),
        company: json["company"] == null
            ? null
            : Map.from(json["company"]).map(
                (k, v) => MapEntry<String, String>(k, v == null ? null : v)),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "info": info == null ? null : info.toJson(),
        "phone": phone == null ? null : List<dynamic>.from(phone.map((x) => x)),
        "email": email == null ? null : List<dynamic>.from(email.map((x) => x)),
        "address": address == null
            ? null
            : List<dynamic>.from(address.map((x) => x.toJson())),
        "seo": seo == null ? null : List<dynamic>.from(seo.map((x) => x)),
        "log": log == null ? null : List<dynamic>.from(log.map((x) => x)),
        "gallery":
            gallery == null ? null : List<dynamic>.from(gallery.map((x) => x)),
        "video": video == null ? null : List<dynamic>.from(video.map((x) => x)),
        "likes": likes == null
            ? null
            : List<dynamic>.from(likes.map((x) => x.toJson())),
        "saves": saves == null
            ? null
            : List<dynamic>.from(saves.map((x) => x.toJson())),
        "comments": comments == null
            ? null
            : List<dynamic>.from(comments.map((x) => x.toJson())),
        "external_link": externalLink == null
            ? null
            : List<dynamic>.from(externalLink.map((x) => x)),
        "attachment": attachment == null
            ? null
            : List<dynamic>.from(attachment.map((x) => x)),
        //"rating": rating == null ? null : List<dynamic>.from(rating.map((x) => x)),
        "company": company == null
            ? null
            : Map.from(company).map(
                (k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)),
        "user": user == null ? null : user.toJson(),
      };
}

class Info {
  Info({
    this.id,
    this.privacyId,
    this.privacyTitle,
    this.propertyListingTypeId,
    this.propertyListingTypeTitle,
    this.propertyListingTypeSlug,
    this.propertyPurposeId,
    this.propertyPurposeTitle,
    this.propertyPurposeSlug,
    this.propertyParentCategoryId,
    this.propertyParentCategoryTitle,
    this.propertyParentCategorySlug,
    this.propertyChildCategoryId,
    this.propertyChildCategoryTitle,
    this.unitId,
    this.unitTitle,
    this.unitSlug,
    this.unitCode,
    this.currencyId,
    this.currencyTitle,
    this.currencySymbol,
    this.currencyCode,
    this.title,
    this.slug,
    this.description,
    this.thumbnail,
    this.publishedDate,
    this.expiredDate,
    this.lastRefreshedDate,
    this.refreshCount,
    this.saveCount,
    this.imageCount,
    this.videoCount,
    this.fileCount,
    this.visitor,
    this.noOfLikes,
    this.noOfComments,
    this.noOfShare,
    this.noOfViewEmail,
    this.noOfViewNumber,
    this.noOfSendEmail,
    this.actionStatus,
    this.status,
    this.createdByCompId,
    this.companyTitle,
    this.companySlug,
    this.companyVerificationStatus,
    this.companyRating,
    this.companyNoOfReviews,
    this.createdByUserId,
    this.userFullName,
    this.userDisplayName,
    this.userImg,
    this.userTimezone,
    this.userSlug,
    this.createdAt,
  });

  String id;
  String privacyId;
  String privacyTitle;
  String propertyListingTypeId;
  String propertyListingTypeTitle;
  String propertyListingTypeSlug;
  String propertyPurposeId;
  String propertyPurposeTitle;
  String propertyPurposeSlug;
  String propertyParentCategoryId;
  String propertyParentCategoryTitle;
  String propertyParentCategorySlug;
  String propertyChildCategoryId;
  String propertyChildCategoryTitle;
  String unitId;
  String unitTitle;
  String unitSlug;
  String unitCode;
  String currencyId;
  String currencyTitle;
  dynamic currencySymbol;
  String currencyCode;
  String title;
  String slug;
  String description;
  String thumbnail;
  DateTime publishedDate;
  DateTime expiredDate;
  DateTime lastRefreshedDate;
  String refreshCount;
  String saveCount;
  String imageCount;
  String videoCount;
  String fileCount;
  String visitor;
  String noOfLikes;
  String noOfComments;
  String noOfShare;
  String noOfViewEmail;
  String noOfViewNumber;
  String noOfSendEmail;
  String actionStatus;
  String status;
  String createdByCompId;
  String companyTitle;
  String companySlug;
  String companyVerificationStatus;
  String companyRating;
  String companyNoOfReviews;
  String createdByUserId;
  String userFullName;
  String userDisplayName;
  String userImg;
  String userTimezone;
  String userSlug;
  DateTime createdAt;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        id: json["id"] == null ? null : json["id"],
        privacyId: json["privacy_id"] == null ? null : json["privacy_id"],
        privacyTitle:
            json["privacy_title"] == null ? null : json["privacy_title"],
        propertyListingTypeId: json["property_listing_type_id"] == null
            ? null
            : json["property_listing_type_id"],
        propertyListingTypeTitle: json["property_listing_type_title"] == null
            ? null
            : json["property_listing_type_title"],
        propertyListingTypeSlug: json["property_listing_type_slug"] == null
            ? null
            : json["property_listing_type_slug"],
        propertyPurposeId: json["property_purpose_id"] == null
            ? null
            : json["property_purpose_id"],
        propertyPurposeTitle: json["property_purpose_title"] == null
            ? null
            : json["property_purpose_title"],
        propertyPurposeSlug: json["property_purpose_slug"] == null
            ? null
            : json["property_purpose_slug"],
        propertyParentCategoryId: json["property_parent_category_id"] == null
            ? null
            : json["property_parent_category_id"],
        propertyParentCategoryTitle:
            json["property_parent_category_title"] == null
                ? null
                : json["property_parent_category_title"],
        propertyParentCategorySlug:
            json["property_parent_category_slug"] == null
                ? null
                : json["property_parent_category_slug"],
        propertyChildCategoryId: json["property_child_category_id"] == null
            ? null
            : json["property_child_category_id"],
        propertyChildCategoryTitle:
            json["property_child_category_title"] == null
                ? null
                : json["property_child_category_title"],
        unitId: json["unit_id"] == null ? null : json["unit_id"],
        unitTitle: json["unit_title"] == null ? null : json["unit_title"],
        unitSlug: json["unit_slug"] == null ? null : json["unit_slug"],
        unitCode: json["unit_code"] == null ? null : json["unit_code"],
        currencyId: json["currency_id"] == null ? null : json["currency_id"],
        currencyTitle:
            json["currency_title"] == null ? null : json["currency_title"],
        currencySymbol: json["currency_symbol"],
        currencyCode:
            json["currency_code"] == null ? null : json["currency_code"],
        title: json["title"] == null ? null : json["title"],
        slug: json["slug"] == null ? null : json["slug"],
        description: json["description"] == null ? null : json["description"],
        thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
        publishedDate: json["published_date"] == null
            ? null
            : DateTime.parse(json["published_date"]),
        expiredDate: json["expired_date"] == null
            ? null
            : DateTime.parse(json["expired_date"]),
        lastRefreshedDate: json["last_refreshed_date"] == null
            ? null
            : DateTime.parse(json["last_refreshed_date"]),
        refreshCount:
            json["refresh_count"] == null ? null : json["refresh_count"],
        saveCount: json["save_count"] == null ? null : json["save_count"],
        imageCount: json["image_count"] == null ? null : json["image_count"],
        videoCount: json["video_count"] == null ? null : json["video_count"],
        fileCount: json["file_count"] == null ? null : json["file_count"],
        visitor: json["visitor"] == null ? null : json["visitor"],
        noOfLikes: json["no_of_likes"] == null ? null : json["no_of_likes"],
        noOfComments:
            json["no_of_comments"] == null ? null : json["no_of_comments"],
        noOfShare: json["no_of_share"] == null ? null : json["no_of_share"],
        noOfViewEmail:
            json["no_of_view_email"] == null ? null : json["no_of_view_email"],
        noOfViewNumber: json["no_of_view_number"] == null
            ? null
            : json["no_of_view_number"],
        noOfSendEmail:
            json["no_of_send_email"] == null ? null : json["no_of_send_email"],
        actionStatus:
            json["action_status"] == null ? null : json["action_status"],
        status: json["status"] == null ? null : json["status"],
        createdByCompId: json["created_by_comp_id"] == null
            ? null
            : json["created_by_comp_id"],
        companyTitle:
            json["company_title"] == null ? null : json["company_title"],
        companySlug: json["company_slug"] == null ? null : json["company_slug"],
        companyVerificationStatus: json["company_verification_status"] == null
            ? null
            : json["company_verification_status"],
        companyRating:
            json["company_rating"] == null ? null : json["company_rating"],
        companyNoOfReviews: json["company_no_of_reviews"] == null
            ? null
            : json["company_no_of_reviews"],
        createdByUserId: json["created_by_user_id"] == null
            ? null
            : json["created_by_user_id"],
        userFullName:
            json["user_full_name"] == null ? null : json["user_full_name"],
        userDisplayName: json["user_display_name"] == null
            ? null
            : json["user_display_name"],
        userImg: json["user_img"] == null ? null : json["user_img"],
        userTimezone:
            json["user_timezone"] == null ? null : json["user_timezone"],
        userSlug: json["user_slug"] == null ? null : json["user_slug"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "privacy_id": privacyId == null ? null : privacyId,
        "privacy_title": privacyTitle == null ? null : privacyTitle,
        "property_listing_type_id":
            propertyListingTypeId == null ? null : propertyListingTypeId,
        "property_listing_type_title":
            propertyListingTypeTitle == null ? null : propertyListingTypeTitle,
        "property_listing_type_slug":
            propertyListingTypeSlug == null ? null : propertyListingTypeSlug,
        "property_purpose_id":
            propertyPurposeId == null ? null : propertyPurposeId,
        "property_purpose_title":
            propertyPurposeTitle == null ? null : propertyPurposeTitle,
        "property_purpose_slug":
            propertyPurposeSlug == null ? null : propertyPurposeSlug,
        "property_parent_category_id":
            propertyParentCategoryId == null ? null : propertyParentCategoryId,
        "property_parent_category_title": propertyParentCategoryTitle == null
            ? null
            : propertyParentCategoryTitle,
        "property_parent_category_slug": propertyParentCategorySlug == null
            ? null
            : propertyParentCategorySlug,
        "property_child_category_id":
            propertyChildCategoryId == null ? null : propertyChildCategoryId,
        "property_child_category_title": propertyChildCategoryTitle == null
            ? null
            : propertyChildCategoryTitle,
        "unit_id": unitId == null ? null : unitId,
        "unit_title": unitTitle == null ? null : unitTitle,
        "unit_slug": unitSlug == null ? null : unitSlug,
        "unit_code": unitCode == null ? null : unitCode,
        "currency_id": currencyId == null ? null : currencyId,
        "currency_title": currencyTitle == null ? null : currencyTitle,
        "currency_symbol": currencySymbol,
        "currency_code": currencyCode == null ? null : currencyCode,
        "title": title == null ? null : title,
        "slug": slug == null ? null : slug,
        "description": description == null ? null : description,
        "thumbnail": thumbnail == null ? null : thumbnail,
        "published_date":
            publishedDate == null ? null : publishedDate.toIso8601String(),
        "expired_date":
            expiredDate == null ? null : expiredDate.toIso8601String(),
        "last_refreshed_date": lastRefreshedDate == null
            ? null
            : lastRefreshedDate.toIso8601String(),
        "refresh_count": refreshCount == null ? null : refreshCount,
        "save_count": saveCount == null ? null : saveCount,
        "image_count": imageCount == null ? null : imageCount,
        "video_count": videoCount == null ? null : videoCount,
        "file_count": fileCount == null ? null : fileCount,
        "visitor": visitor == null ? null : visitor,
        "no_of_likes": noOfLikes == null ? null : noOfLikes,
        "no_of_comments": noOfComments == null ? null : noOfComments,
        "no_of_share": noOfShare == null ? null : noOfShare,
        "no_of_view_email": noOfViewEmail == null ? null : noOfViewEmail,
        "no_of_view_number": noOfViewNumber == null ? null : noOfViewNumber,
        "no_of_send_email": noOfSendEmail == null ? null : noOfSendEmail,
        "action_status": actionStatus == null ? null : actionStatus,
        "status": status == null ? null : status,
        "created_by_comp_id": createdByCompId == null ? null : createdByCompId,
        "company_title": companyTitle == null ? null : companyTitle,
        "company_slug": companySlug == null ? null : companySlug,
        "company_verification_status": companyVerificationStatus == null
            ? null
            : companyVerificationStatus,
        "company_rating": companyRating == null ? null : companyRating,
        "company_no_of_reviews":
            companyNoOfReviews == null ? null : companyNoOfReviews,
        "created_by_user_id": createdByUserId == null ? null : createdByUserId,
        "user_full_name": userFullName == null ? null : userFullName,
        "user_display_name": userDisplayName == null ? null : userDisplayName,
        "user_img": userImg == null ? null : userImg,
        "user_timezone": userTimezone == null ? null : userTimezone,
        "user_slug": userSlug == null ? null : userSlug,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
      };
}

class User {
  User({
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
    this.updatedByUserId,
    this.deletedByUserId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
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
  dynamic updatedByUserId;
  dynamic deletedByUserId;
  DateTime createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        compId: json["comp_id"] == null ? null : json["comp_id"],
        companyName: json["company_name"] == null ? null : json["company_name"],
        userLevelId:
            json["user_level_id"] == null ? null : json["user_level_id"],
        userLevelTitle:
            json["user_level_title"] == null ? null : json["user_level_title"],
        userRulGpNamId: json["user_rul_gp_nam_id"] == null
            ? null
            : json["user_rul_gp_nam_id"],
        userRulGpNamTitle: json["user_rul_gp_nam_title"] == null
            ? null
            : json["user_rul_gp_nam_title"],
        membershipId:
            json["membership_id"] == null ? null : json["membership_id"],
        membershipName:
            json["membership_name"] == null ? null : json["membership_name"],
        countryCodeId: json["country_code_id"],
        systemUserTypeId: json["system_user_type_id"] == null
            ? null
            : json["system_user_type_id"],
        fullName: json["full_name"] == null ? null : json["full_name"],
        displayName: json["display_name"] == null ? null : json["display_name"],
        gender: json["gender"],
        dateOfBirth: json["date_of_birth"],
        cnicNo: json["cnic_no"],
        username: json["username"] == null ? null : json["username"],
        img: json["img"] == null ? null : json["img"],
        signatureImage: json["signature_image"],
        slug: json["slug"] == null ? null : json["slug"],
        email: json["email"] == null ? null : json["email"],
        primaryEmailCode: json["primary_email_code"] == null
            ? null
            : json["primary_email_code"],
        primaryEmailStatus: json["primary_email_status"] == null
            ? null
            : json["primary_email_status"],
        primaryNumber:
            json["primary_number"] == null ? null : json["primary_number"],
        primaryNumberCode: json["primary_number_code"] == null
            ? null
            : json["primary_number_code"],
        primaryNumberStatus: json["primary_number_status"] == null
            ? null
            : json["primary_number_status"],
        password: json["password"] == null ? null : json["password"],
        rememberToken: json["remember_token"],
        liveStatus: json["live_status"] == null ? null : json["live_status"],
        points: json["points"] == null ? null : json["points"],
        about: json["about"],
        validFrom: json["valid_from"] == null
            ? null
            : DateTime.parse(json["valid_from"]),
        validTill: json["valid_till"] == null
            ? null
            : DateTime.parse(json["valid_till"]),
        openingBalance:
            json["opening_balance"] == null ? null : json["opening_balance"],
        closingBalance:
            json["closing_balance"] == null ? null : json["closing_balance"],
        balanceTotal:
            json["balance_total"] == null ? null : json["balance_total"],
        status: json["status"] == null ? null : json["status"],
        orderBy: json["order_by"],
        createdByCompId: json["created_by_comp_id"] == null
            ? null
            : json["created_by_comp_id"],
        createdByUserId: json["created_by_user_id"] == null
            ? null
            : json["created_by_user_id"],
        updatedByUserId: json["updated_by_user_id"],
        deletedByUserId: json["deleted_by_user_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "comp_id": compId == null ? null : compId,
        "company_name": companyName == null ? null : companyName,
        "user_level_id": userLevelId == null ? null : userLevelId,
        "user_level_title": userLevelTitle == null ? null : userLevelTitle,
        "user_rul_gp_nam_id": userRulGpNamId == null ? null : userRulGpNamId,
        "user_rul_gp_nam_title":
            userRulGpNamTitle == null ? null : userRulGpNamTitle,
        "membership_id": membershipId == null ? null : membershipId,
        "membership_name": membershipName == null ? null : membershipName,
        "country_code_id": countryCodeId,
        "system_user_type_id":
            systemUserTypeId == null ? null : systemUserTypeId,
        "full_name": fullName == null ? null : fullName,
        "display_name": displayName == null ? null : displayName,
        "gender": gender,
        "date_of_birth": dateOfBirth,
        "cnic_no": cnicNo,
        "username": username == null ? null : username,
        "img": img == null ? null : img,
        "signature_image": signatureImage,
        "slug": slug == null ? null : slug,
        "email": email == null ? null : email,
        "primary_email_code":
            primaryEmailCode == null ? null : primaryEmailCode,
        "primary_email_status":
            primaryEmailStatus == null ? null : primaryEmailStatus,
        "primary_number": primaryNumber == null ? null : primaryNumber,
        "primary_number_code":
            primaryNumberCode == null ? null : primaryNumberCode,
        "primary_number_status":
            primaryNumberStatus == null ? null : primaryNumberStatus,
        "password": password == null ? null : password,
        "remember_token": rememberToken,
        "live_status": liveStatus == null ? null : liveStatus,
        "points": points == null ? null : points,
        "about": about,
        "valid_from": validFrom == null ? null : validFrom.toIso8601String(),
        "valid_till": validTill == null ? null : validTill.toIso8601String(),
        "opening_balance": openingBalance == null ? null : openingBalance,
        "closing_balance": closingBalance == null ? null : closingBalance,
        "balance_total": balanceTotal == null ? null : balanceTotal,
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

class LikeAndComment {
  LikeAndComment({
    this.id,
    this.referenceId,
    this.referenceType,
    this.parentCommentId,
    this.text,
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
    this.likeType,
  });

  String id;
  String referenceId;
  String referenceType;
  dynamic parentCommentId;
  String text;
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
  String likeType;

  factory LikeAndComment.fromJson(Map<String, dynamic> json) => LikeAndComment(
        id: json["id"] == null ? null : json["id"],
        referenceId: json["reference_id"] == null ? null : json["reference_id"],
        referenceType:
            json["reference_type"] == null ? null : json["reference_type"],
        parentCommentId: json["parent_comment_id"],
        text: json["text"] == null ? null : json["text"],
        status: json["status"] == null ? null : json["status"],
        orderBy: json["order_by"],
        createdByCompId: json["created_by_comp_id"] == null
            ? null
            : json["created_by_comp_id"],
        createdByUserId: json["created_by_user_id"] == null
            ? null
            : json["created_by_user_id"],
        userFullName:
            json["user_full_name"] == null ? null : json["user_full_name"],
        userDisplayName: json["user_display_name"] == null
            ? null
            : json["user_display_name"],
        userImg: json["user_img"] == null ? null : json["user_img"],
        userTimezone:
            json["user_timezone"] == null ? null : json["user_timezone"],
        userSlug: json["user_slug"] == null ? null : json["user_slug"],
        updatedByUserId: json["updated_by_user_id"],
        deletedByUserId: json["deleted_by_user_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
        likeType: json["like_type"] == null ? null : json["like_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "reference_id": referenceId == null ? null : referenceId,
        "reference_type": referenceType == null ? null : referenceType,
        "parent_comment_id": parentCommentId,
        "text": text == null ? null : text,
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
        "like_type": likeType == null ? null : likeType,
      };
}

class Address {
  Address({
    this.id,
    this.countryId,
    this.countryTitle,
    this.countrySlug,
    this.countryTwoLetterCode,
    this.countryThreeLetterCode,
    this.countryFlag,
    this.countryLatitude,
    this.countryLongitude,
    this.provinceId,
    this.provinceTitle,
    this.provinceTwoLetterCode,
    this.provinceLatitude,
    this.provinceLongitude,
    this.cityId,
    this.cityTitle,
    this.cityLatitude,
    this.cityLongitude,
    this.areaId,
    this.areaTitle,
    this.areaCode,
    this.areaLatitude,
    this.areaLongitude,
    this.locationId,
    this.locationTitle,
    this.locationLatitude,
    this.locationLongitude,
    this.referenceId,
    this.referenceType,
    this.title,
    this.address,
    this.postalCode,
    this.latitude,
    this.longitude,
    this.verificationStatus,
    this.verificationCode,
    this.status,
    this.orderBy,
    this.createdByCompId,
    this.createdByUserId,
  });

  String id;
  String countryId;
  String countryTitle;
  dynamic countrySlug;
  String countryTwoLetterCode;
  String countryThreeLetterCode;
  dynamic countryFlag;
  String countryLatitude;
  String countryLongitude;
  String provinceId;
  String provinceTitle;
  dynamic provinceTwoLetterCode;
  String provinceLatitude;
  String provinceLongitude;
  String cityId;
  String cityTitle;
  String cityLatitude;
  String cityLongitude;
  String areaId;
  String areaTitle;
  String areaCode;
  String areaLatitude;
  String areaLongitude;
  String locationId;
  String locationTitle;
  String locationLatitude;
  String locationLongitude;
  String referenceId;
  String referenceType;
  dynamic title;
  String address;
  String postalCode;
  String latitude;
  String longitude;
  String verificationStatus;
  String verificationCode;
  String status;
  dynamic orderBy;
  String createdByCompId;
  String createdByUserId;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"] == null ? null : json["id"],
        countryId: json["country_id"] == null ? null : json["country_id"],
        countryTitle:
            json["country_title"] == null ? null : json["country_title"],
        countrySlug: json["country_slug"],
        countryTwoLetterCode: json["country_two_letter_code"] == null
            ? null
            : json["country_two_letter_code"],
        countryThreeLetterCode: json["country_three_letter_code"] == null
            ? null
            : json["country_three_letter_code"],
        countryFlag: json["country_flag"],
        countryLatitude:
            json["country_latitude"] == null ? null : json["country_latitude"],
        countryLongitude: json["country_longitude"] == null
            ? null
            : json["country_longitude"],
        provinceId: json["province_id"] == null ? null : json["province_id"],
        provinceTitle:
            json["province_title"] == null ? null : json["province_title"],
        provinceTwoLetterCode: json["province_two_letter_code"],
        provinceLatitude: json["province_latitude"] == null
            ? null
            : json["province_latitude"],
        provinceLongitude: json["province_longitude"] == null
            ? null
            : json["province_longitude"],
        cityId: json["city_id"] == null ? null : json["city_id"],
        cityTitle: json["city_title"] == null ? null : json["city_title"],
        cityLatitude:
            json["city_latitude"] == null ? null : json["city_latitude"],
        cityLongitude:
            json["city_longitude"] == null ? null : json["city_longitude"],
        areaId: json["area_id"] == null ? null : json["area_id"],
        areaTitle: json["area_title"] == null ? null : json["area_title"],
        areaCode: json["area_code"] == null ? null : json["area_code"],
        areaLatitude:
            json["area_latitude"] == null ? null : json["area_latitude"],
        areaLongitude:
            json["area_longitude"] == null ? null : json["area_longitude"],
        locationId: json["location_id"] == null ? null : json["location_id"],
        locationTitle:
            json["location_title"] == null ? null : json["location_title"],
        locationLatitude: json["location_latitude"] == null
            ? null
            : json["location_latitude"],
        locationLongitude: json["location_longitude"] == null
            ? null
            : json["location_longitude"],
        referenceId: json["reference_id"] == null ? null : json["reference_id"],
        referenceType:
            json["reference_type"] == null ? null : json["reference_type"],
        title: json["title"],
        address: json["address"] == null ? null : json["address"],
        postalCode: json["postal_code"] == null ? null : json["postal_code"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        verificationStatus: json["verification_status"] == null
            ? null
            : json["verification_status"],
        verificationCode: json["verification_code"] == null
            ? null
            : json["verification_code"],
        status: json["status"] == null ? null : json["status"],
        orderBy: json["order_by"],
        createdByCompId: json["created_by_comp_id"] == null
            ? null
            : json["created_by_comp_id"],
        createdByUserId: json["created_by_user_id"] == null
            ? null
            : json["created_by_user_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "country_id": countryId == null ? null : countryId,
        "country_title": countryTitle == null ? null : countryTitle,
        "country_slug": countrySlug,
        "country_two_letter_code":
            countryTwoLetterCode == null ? null : countryTwoLetterCode,
        "country_three_letter_code":
            countryThreeLetterCode == null ? null : countryThreeLetterCode,
        "country_flag": countryFlag,
        "country_latitude": countryLatitude == null ? null : countryLatitude,
        "country_longitude": countryLongitude == null ? null : countryLongitude,
        "province_id": provinceId == null ? null : provinceId,
        "province_title": provinceTitle == null ? null : provinceTitle,
        "province_two_letter_code": provinceTwoLetterCode,
        "province_latitude": provinceLatitude == null ? null : provinceLatitude,
        "province_longitude":
            provinceLongitude == null ? null : provinceLongitude,
        "city_id": cityId == null ? null : cityId,
        "city_title": cityTitle == null ? null : cityTitle,
        "city_latitude": cityLatitude == null ? null : cityLatitude,
        "city_longitude": cityLongitude == null ? null : cityLongitude,
        "area_id": areaId == null ? null : areaId,
        "area_title": areaTitle == null ? null : areaTitle,
        "area_code": areaCode == null ? null : areaCode,
        "area_latitude": areaLatitude == null ? null : areaLatitude,
        "area_longitude": areaLongitude == null ? null : areaLongitude,
        "location_id": locationId == null ? null : locationId,
        "location_title": locationTitle == null ? null : locationTitle,
        "location_latitude": locationLatitude == null ? null : locationLatitude,
        "location_longitude":
            locationLongitude == null ? null : locationLongitude,
        "reference_id": referenceId == null ? null : referenceId,
        "reference_type": referenceType == null ? null : referenceType,
        "title": title,
        "address": address == null ? null : address,
        "postal_code": postalCode == null ? null : postalCode,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "verification_status":
            verificationStatus == null ? null : verificationStatus,
        "verification_code": verificationCode == null ? null : verificationCode,
        "status": status == null ? null : status,
        "order_by": orderBy,
        "created_by_comp_id": createdByCompId == null ? null : createdByCompId,
        "created_by_user_id": createdByUserId == null ? null : createdByUserId,
      };
}

class Save {
  Save({
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
    this.createdAt,
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
  DateTime createdAt;

  factory Save.fromJson(Map<String, dynamic> json) => Save(
        id: json["id"] == null ? null : json["id"],
        referenceId: json["reference_id"] == null ? null : json["reference_id"],
        referenceType:
            json["reference_type"] == null ? null : json["reference_type"],
        status: json["status"] == null ? null : json["status"],
        orderBy: json["order_by"],
        createdByCompId: json["created_by_comp_id"] == null
            ? null
            : json["created_by_comp_id"],
        createdByUserId: json["created_by_user_id"] == null
            ? null
            : json["created_by_user_id"],
        userFullName:
            json["user_full_name"] == null ? null : json["user_full_name"],
        userDisplayName: json["user_display_name"] == null
            ? null
            : json["user_display_name"],
        userImg: json["user_img"] == null ? null : json["user_img"],
        userTimezone:
            json["user_timezone"] == null ? null : json["user_timezone"],
        userSlug: json["user_slug"] == null ? null : json["user_slug"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
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
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
      };
}
