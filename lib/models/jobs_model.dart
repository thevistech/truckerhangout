// To parse this JSON data, do
//
//     final jobsModel = jobsModelFromJson(jsonString);

import 'dart:convert';

JobsModel jobsModelFromJson(String str) => JobsModel.fromJson(json.decode(str));

String jobsModelToJson(JobsModel data) => json.encode(data.toJson());

class JobsModel {
  JobsModel({
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

  factory JobsModel.fromJson(Map<String, dynamic> json) => JobsModel(
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
    this.info,
    this.type,
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
    //this.rating,
    this.company,
    this.user,
    this.applied,
    this.noOfApplied,
  });

  Info info;
  List<dynamic> type;
  List<dynamic> phone;
  List<dynamic> email;
  List<dynamic> address;
  List<dynamic> seo;
  List<dynamic> log;
  List<dynamic> gallery;
  List<dynamic> video;
  List<Like> likes;
  List<Comment> comments;
  List<dynamic> externalLink;
  List<dynamic> attachment;
 // List<dynamic> rating;
  Map<String, String> company;
  User user;
  Applied applied;
  Applied noOfApplied;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    info: Info.fromJson(json["info"]),
    type: List<dynamic>.from(json["type"].map((x) => x)),
    phone: List<dynamic>.from(json["phone"].map((x) => x)),
    email: List<dynamic>.from(json["email"].map((x) => x)),
    address: List<dynamic>.from(json["address"].map((x) => x)),
    seo: List<dynamic>.from(json["seo"].map((x) => x)),
    log: List<dynamic>.from(json["log"].map((x) => x)),
    gallery: List<dynamic>.from(json["gallery"].map((x) => x)),
    video: List<dynamic>.from(json["video"].map((x) => x)),
    likes: List<Like>.from(json["likes"].map((x) => Like.fromJson(x))),
    comments: List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
    externalLink: List<dynamic>.from(json["external_link"].map((x) => x)),
    attachment: List<dynamic>.from(json["attachment"].map((x) => x)),
    //rating: List<dynamic>.from(json["rating"].map((x) => x)),
    company: Map.from(json["company"]).map((k, v) => MapEntry<String, String>(k, v == null ? null : v)),
    user: User.fromJson(json["user"]),
    applied: Applied.fromJson(json["applied"]),
    noOfApplied: Applied.fromJson(json["no_of_applied"]),
  );

  Map<String, dynamic> toJson() => {
    "info": info.toJson(),
    "type": List<dynamic>.from(type.map((x) => x)),
    "phone": List<dynamic>.from(phone.map((x) => x)),
    "email": List<dynamic>.from(email.map((x) => x)),
    "address": List<dynamic>.from(address.map((x) => x)),
    "seo": List<dynamic>.from(seo.map((x) => x)),
    "log": List<dynamic>.from(log.map((x) => x)),
    "gallery": List<dynamic>.from(gallery.map((x) => x)),
    "video": List<dynamic>.from(video.map((x) => x)),
    "likes": List<dynamic>.from(likes.map((x) => x.toJson())),
    "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
    "external_link": List<dynamic>.from(externalLink.map((x) => x)),
    "attachment": List<dynamic>.from(attachment.map((x) => x)),
    //"rating": List<dynamic>.from(rating.map((x) => x)),
    "company": Map.from(company).map((k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)),
    "user": user.toJson(),
    "applied": applied.toJson(),
    "no_of_applied": noOfApplied.toJson(),
  };
}

class Applied {
  Applied({
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
  List<dynamic> data;
  dynamic from;
  int lastPage;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  dynamic to;
  int total;

  factory Applied.fromJson(Map<String, dynamic> json) => Applied(
    currentPage: json["current_page"],
    data: List<dynamic>.from(json["data"].map((x) => x)),
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
    "data": List<dynamic>.from(data.map((x) => x)),
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

class Comment {
  Comment({
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

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    id: json["id"],
    referenceId: json["reference_id"],
    referenceType: json["reference_type"],
    parentCommentId: json["parent_comment_id"],
    text: json["text"],
    status: json["status"],
    orderBy: json["order_by"],
    createdByCompId: json["created_by_comp_id"],
    createdByUserId: json["created_by_user_id"],
    userFullName: json["user_full_name"],
    userDisplayName: json["user_display_name"],
    userImg: json["user_img"],
    userTimezone: json["user_timezone"],
    userSlug: json["user_slug"],
    updatedByUserId: json["updated_by_user_id"],
    deletedByUserId: json["deleted_by_user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "reference_id": referenceId,
    "reference_type": referenceType,
    "parent_comment_id": parentCommentId,
    "text": text,
    "status": status,
    "order_by": orderBy,
    "created_by_comp_id": createdByCompId,
    "created_by_user_id": createdByUserId,
    "user_full_name": userFullName,
    "user_display_name": userDisplayName,
    "user_img": userImg,
    "user_timezone": userTimezone,
    "user_slug": userSlug,
    "updated_by_user_id": updatedByUserId,
    "deleted_by_user_id": deletedByUserId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
  };
}

class Info {
  Info({
    this.id,
    this.jobListingTypeId,
    this.jobListingTypeTitle,
    this.jobParentCategoryId,
    this.jobParentCategoryTitle,
    this.jobParentCategorySlug,
    this.jobChildCategoryId,
    this.jobSubChildCategoryId,
    this.currencyId,
    this.currencyTitle,
    this.freightTypeId,
    this.freightTypeTitle,
    this.freightTypeSlug,
    this.driverTypeId,
    this.driverTypeTitle,
    this.driverTypeSlug,
    this.title,
    this.slug,
    this.description,
    this.thumbnail,
    this.publishedDate,
    this.expiredDate,
    this.lastRefreshedDate,
    this.lastListingTypeChangeDate,
    this.refreshCount,
    this.imageCount,
    this.videoCount,
    this.fileCount,
    this.visitor,
    this.noOfLikes,
    this.noOfComments,
    this.noOfShare,
    this.noOfApply,
    this.noOfViewEmail,
    this.noOfViewNumber,
    this.noOfSendEmail,
    this.userFullName,
    this.userDisplayName,
    this.userImg,
    this.userTimezone,
    this.userSlug,
    this.contactAddressId,
    this.contactAddressCountryId,
    this.contactAddressProvinceId,
    this.contactAddressCityId,
    this.contactAddressAreaId,
    this.contactAddressLocationId,
    this.contactAddressReferenceId,
    this.contactAddressReferenceType,
    this.contactAddressAddress,
    this.contactAddressPostalCode,
    this.contactAddressPostalLatitude,
    this.contactAddressPostalLongitude,
    this.contactAddressPostalStatus,
    this.contactAddressVerificationStatus,
    this.provincesTwoLetterCode,
    this.provincesLatitude,
    this.provincesLongitude,
    this.cityName,
    this.cityLatitude,
    this.cityLongitude,
    this.contactEmailAddressesReferenceId,
    this.contactEmailAddressesReferenceType,
    this.contactEmailAddressesEmail,
    this.contactEmailAddressesVerificationStatus,
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
    this.hostTypeTitle,
    this.videoTitle,
    this.videoSource,
    this.createdByUserId,
  });

  String id;
  String jobListingTypeId;
  String jobListingTypeTitle;
  String jobParentCategoryId;
  String jobParentCategoryTitle;
  String jobParentCategorySlug;
  dynamic jobChildCategoryId;
  dynamic jobSubChildCategoryId;
  String currencyId;
  String currencyTitle;
  String freightTypeId;
  String freightTypeTitle;
  String freightTypeSlug;
  dynamic driverTypeId;
  dynamic driverTypeTitle;
  dynamic driverTypeSlug;
  String title;
  String slug;
  String description;
  dynamic thumbnail;
  DateTime publishedDate;
  dynamic expiredDate;
  dynamic lastRefreshedDate;
  dynamic lastListingTypeChangeDate;
  String refreshCount;
  String imageCount;
  String videoCount;
  String fileCount;
  String visitor;
  String noOfLikes;
  String noOfComments;
  String noOfShare;
  String noOfApply;
  String noOfViewEmail;
  String noOfViewNumber;
  String noOfSendEmail;
  String userFullName;
  String userDisplayName;
  String userImg;
  String userTimezone;
  String userSlug;
  String contactAddressId;
  String contactAddressCountryId;
  String contactAddressProvinceId;
  String contactAddressCityId;
  dynamic contactAddressAreaId;
  dynamic contactAddressLocationId;
  String contactAddressReferenceId;
  String contactAddressReferenceType;
  String contactAddressAddress;
  String contactAddressPostalCode;
  String contactAddressPostalLatitude;
  String contactAddressPostalLongitude;
  String contactAddressPostalStatus;
  String contactAddressVerificationStatus;

  String provincesTwoLetterCode;
  String provincesLatitude;
  String provincesLongitude;
  String cityName;
  String cityLatitude;
  String cityLongitude;
  String contactEmailAddressesReferenceId;
  String contactEmailAddressesReferenceType;
  String contactEmailAddressesEmail;
  String contactEmailAddressesVerificationStatus;
  String status;
  dynamic orderBy;
  String createdByCompId;
  String companyTitle;
  String companySlug;
  dynamic companyLogo;
  dynamic companyAbout;
  String companyVerificationStatus;
  String companyRating;
  dynamic companySlogan;
  String companyNoOfReviews;
  dynamic companySince;
  dynamic hostTypeTitle;
  dynamic videoTitle;
  dynamic videoSource;
  String createdByUserId;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    id: json["id"],
    jobListingTypeId: json["job_listing_type_id"],
    jobListingTypeTitle: json["job_listing_type_title"],
    jobParentCategoryId: json["job_parent_category_id"],
    jobParentCategoryTitle: json["job_parent_category_title"],
    jobParentCategorySlug: json["job_parent_category_slug"],
    jobChildCategoryId: json["job_child_category_id"],
    jobSubChildCategoryId: json["job_sub_child_category_id"],
    currencyId: json["currency_id"],
    currencyTitle: json["currency_title"],
    freightTypeId: json["freight_type_id"],
    freightTypeTitle: json["freight_type_title"],
    freightTypeSlug: json["freight_type_slug"],
    driverTypeId: json["driver_type_id"],
    driverTypeTitle: json["driver_type_title"],
    driverTypeSlug: json["driver_type_slug"],
    title: json["title"],
    slug: json["slug"],
    description: json["description"],
    thumbnail: json["thumbnail"],
    publishedDate: DateTime.parse(json["published_date"]),
    expiredDate: json["expired_date"],
    lastRefreshedDate: json["last_refreshed_date"],
    lastListingTypeChangeDate: json["last_listing_type_change_date"],
    refreshCount: json["refresh_count"],
    imageCount: json["image_count"],
    videoCount: json["video_count"],
    fileCount: json["file_count"],
    visitor: json["visitor"],
    noOfLikes: json["no_of_likes"],
    noOfComments: json["no_of_comments"],
    noOfShare: json["no_of_share"],
    noOfApply: json["no_of_apply"],
    noOfViewEmail: json["no_of_view_email"],
    noOfViewNumber: json["no_of_view_number"],
    noOfSendEmail: json["no_of_send_email"],
    userFullName: json["user_full_name"],
    userDisplayName: json["user_display_name"],
    userImg: json["user_img"],
    userTimezone: json["user_timezone"],
    userSlug: json["user_slug"],
    contactAddressId: json["contact_address_id"],
    contactAddressCountryId: json["contact_address_country_id"],
    contactAddressProvinceId: json["contact_address_province_id"],
    contactAddressCityId: json["contact_address_city_id"],
    contactAddressAreaId: json["contact_address_area_id"],
    contactAddressLocationId: json["contact_address_location_id"],
    contactAddressReferenceId: json["contact_address_reference_id"],
    contactAddressReferenceType: json["contact_address_reference_type"],
    contactAddressAddress: json["contact_address_address"],
    contactAddressPostalCode: json["contact_address_postal_code"],
    contactAddressPostalLatitude: json["contact_address_postal_latitude"],
    contactAddressPostalLongitude: json["contact_address_postal_longitude"],
    contactAddressPostalStatus: json["contact_address_postal_status"],
    contactAddressVerificationStatus: json["contact_address_verification_status"],
    provincesTwoLetterCode: json["provinces_two_letter_code"],
    provincesLatitude: json["provinces_latitude"],
    provincesLongitude: json["provinces_longitude"],
    cityName: json["city_name"],
    cityLatitude: json["city_latitude"],
    cityLongitude: json["city_longitude"],
    contactEmailAddressesReferenceId: json["contact_email_addresses_reference_id"],
    contactEmailAddressesReferenceType: json["contact_email_addresses_reference_type"],
    contactEmailAddressesEmail: json["contact_email_addresses_email"],
    contactEmailAddressesVerificationStatus: json["contact_email_addresses_verification_status"],
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
    hostTypeTitle: json["host_type_title"],
    videoTitle: json["video_title"],
    videoSource: json["video_source"],
    createdByUserId: json["created_by_user_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "job_listing_type_id": jobListingTypeId,
    "job_listing_type_title": jobListingTypeTitle,
    "job_parent_category_id": jobParentCategoryId,
    "job_parent_category_title": jobParentCategoryTitle,
    "job_parent_category_slug": jobParentCategorySlug,
    "job_child_category_id": jobChildCategoryId,
    "job_sub_child_category_id": jobSubChildCategoryId,
    "currency_id": currencyId,
    "currency_title": currencyTitle,
    "freight_type_id": freightTypeId,
    "freight_type_title": freightTypeTitle,
    "freight_type_slug": freightTypeSlug,
    "driver_type_id": driverTypeId,
    "driver_type_title": driverTypeTitle,
    "driver_type_slug": driverTypeSlug,
    "title": title,
    "slug": slug,
    "description": description,
    "thumbnail": thumbnail,
    "published_date": publishedDate.toIso8601String(),
    "expired_date": expiredDate,
    "last_refreshed_date": lastRefreshedDate,
    "last_listing_type_change_date": lastListingTypeChangeDate,
    "refresh_count": refreshCount,
    "image_count": imageCount,
    "video_count": videoCount,
    "file_count": fileCount,
    "visitor": visitor,
    "no_of_likes": noOfLikes,
    "no_of_comments": noOfComments,
    "no_of_share": noOfShare,
    "no_of_apply": noOfApply,
    "no_of_view_email": noOfViewEmail,
    "no_of_view_number": noOfViewNumber,
    "no_of_send_email": noOfSendEmail,
    "user_full_name": userFullName,
    "user_display_name": userDisplayName,
    "user_img": userImg,
    "user_timezone": userTimezone,
    "user_slug": userSlug,
    "contact_address_id": contactAddressId,
    "contact_address_country_id": contactAddressCountryId,
    "contact_address_province_id": contactAddressProvinceId,
    "contact_address_city_id": contactAddressCityId,
    "contact_address_area_id": contactAddressAreaId,
    "contact_address_location_id": contactAddressLocationId,
    "contact_address_reference_id": contactAddressReferenceId,
    "contact_address_reference_type": contactAddressReferenceType,
    "contact_address_address": contactAddressAddress,
    "contact_address_postal_code": contactAddressPostalCode,
    "contact_address_postal_latitude": contactAddressPostalLatitude,
    "contact_address_postal_longitude": contactAddressPostalLongitude,
    "contact_address_postal_status": contactAddressPostalStatus,
    "contact_address_verification_status": contactAddressVerificationStatus,
    "provinces_two_letter_code": provincesTwoLetterCode,
    "provinces_latitude": provincesLatitude,
    "provinces_longitude": provincesLongitude,
    "city_name": cityName,
    "city_latitude": cityLatitude,
    "city_longitude": cityLongitude,
    "contact_email_addresses_reference_id": contactEmailAddressesReferenceId,
    "contact_email_addresses_reference_type": contactEmailAddressesReferenceType,
    "contact_email_addresses_email": contactEmailAddressesEmail,
    "contact_email_addresses_verification_status": contactEmailAddressesVerificationStatus,
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
    "host_type_title": hostTypeTitle,
    "video_title": videoTitle,
    "video_source": videoSource,
    "created_by_user_id": createdByUserId,
  };
}

class Like {
  Like({
    this.id,
    this.referenceId,
    this.referenceType,
    this.likeType,
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
  String likeType;
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

  factory Like.fromJson(Map<String, dynamic> json) => Like(
    id: json["id"],
    referenceId: json["reference_id"],
    referenceType: json["reference_type"],
    likeType: json["like_type"],
    status: json["status"],
    orderBy: json["order_by"],
    createdByCompId: json["created_by_comp_id"],
    createdByUserId: json["created_by_user_id"],
    userFullName: json["user_full_name"],
    userDisplayName: json["user_display_name"],
    userImg: json["user_img"],
    userTimezone: json["user_timezone"],
    userSlug: json["user_slug"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "reference_id": referenceId,
    "reference_type": referenceType,
    "like_type": likeType,
    "status": status,
    "order_by": orderBy,
    "created_by_comp_id": createdByCompId,
    "created_by_user_id": createdByUserId,
    "user_full_name": userFullName,
    "user_display_name": userDisplayName,
    "user_img": userImg,
    "user_timezone": userTimezone,
    "user_slug": userSlug,
    "created_at": createdAt.toIso8601String(),
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
    //this.dateOfBirth,
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
  String countryCodeId;
  String systemUserTypeId;
  String fullName;
  String displayName;
  String gender;
  //DateTime dateOfBirth;
  String cnicNo;
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
  dynamic validFrom;
  dynamic validTill;
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
    //dateOfBirth: DateTime.parse(json["date_of_birth"]),
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
    validFrom: json["valid_from"],
    validTill: json["valid_till"],
    openingBalance: json["opening_balance"],
    closingBalance: json["closing_balance"],
    balanceTotal: json["balance_total"],
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
    //"date_of_birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
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
    "valid_from": validFrom,
    "valid_till": validTill,
    "opening_balance": openingBalance,
    "closing_balance": closingBalance,
    "balance_total": balanceTotal,
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
