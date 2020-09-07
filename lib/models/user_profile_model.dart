// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
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

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
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
  String countryCodeId;
  String systemUserTypeId;
  String fullName;
  String displayName;
  String gender;
  DateTime dateOfBirth;
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
