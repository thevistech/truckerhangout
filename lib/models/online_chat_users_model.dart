// To parse this JSON data, do
//
//     final onlineUsersChat = onlineUsersChatFromJson(jsonString);

import 'dart:convert';

OnlineUsersChat onlineUsersChatFromJson(String str) => OnlineUsersChat.fromJson(json.decode(str));

String onlineUsersChatToJson(OnlineUsersChat data) => json.encode(data.toJson());

class OnlineUsersChat {
  OnlineUsersChat({
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

  factory OnlineUsersChat.fromJson(Map<String, dynamic> json) => OnlineUsersChat(
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
    this.bio,
    this.designation,
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
    this.following,
    this.followers,
    this.status,
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
  dynamic bio;
  dynamic designation;
  dynamic gender;
  dynamic dateOfBirth;
  dynamic cnicNo;
  String username;
  dynamic img;
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
  String following;
  String followers;
  String status;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
    bio: json["bio"],
    designation: json["designation"],
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
    following: json["following"],
    followers: json["followers"],
    status: json["status"],
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
    "bio": bio,
    "designation": designation,
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
    "following": following,
    "followers": followers,
    "status": status,
  };
}
