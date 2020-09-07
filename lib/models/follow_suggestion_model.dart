// To parse this JSON data, do
//
//     final followSuggestion = followSuggestionFromJson(jsonString);

import 'dart:convert';

FollowSuggestion followSuggestionFromJson(String str) => FollowSuggestion.fromJson(json.decode(str));

String followSuggestionToJson(FollowSuggestion data) => json.encode(data.toJson());

class FollowSuggestion {
    FollowSuggestion({
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

    factory FollowSuggestion.fromJson(Map<String, dynamic> json) => FollowSuggestion(
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
        this.compId,
        this.companyName,
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
    String membershipId;
    String membershipName;
    String countryCodeId;
    String systemUserTypeId;
    String fullName;
    String displayName;
    String bio;
    dynamic designation;
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
    String following;
    String followers;
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
        compId: json["comp_id"] == null ? null : json["comp_id"],
        companyName: json["company_name"] == null ? null : json["company_name"],
        membershipId: json["membership_id"] == null ? null : json["membership_id"],
        membershipName: json["membership_name"] == null ? null : json["membership_name"],
        countryCodeId: json["country_code_id"] == null ? null : json["country_code_id"],
        systemUserTypeId: json["system_user_type_id"] == null ? null : json["system_user_type_id"],
        fullName: json["full_name"] == null ? null : json["full_name"],
        displayName: json["display_name"] == null ? null : json["display_name"],
        bio: json["bio"] == null ? null : json["bio"],
        designation: json["designation"],
        gender: json["gender"] == null ? null : json["gender"],
        dateOfBirth: json["date_of_birth"] == null ? null : DateTime.parse(json["date_of_birth"]),
        cnicNo: json["cnic_no"] == null ? null : json["cnic_no"],
        username: json["username"] == null ? null : json["username"],
        img: json["img"] == null ? null : json["img"],
        signatureImage: json["signature_image"],
        slug: json["slug"] == null ? null : json["slug"],
        email: json["email"] == null ? null : json["email"],
        primaryEmailCode: json["primary_email_code"] == null ? null : json["primary_email_code"],
        primaryEmailStatus: json["primary_email_status"] == null ? null : json["primary_email_status"],
        primaryNumber: json["primary_number"] == null ? null : json["primary_number"],
        primaryNumberCode: json["primary_number_code"] == null ? null : json["primary_number_code"],
        primaryNumberStatus: json["primary_number_status"] == null ? null : json["primary_number_status"],
        password: json["password"] == null ? null : json["password"],
        rememberToken: json["remember_token"],
        liveStatus: json["live_status"] == null ? null : json["live_status"],
        points: json["points"] == null ? null : json["points"],
        about: json["about"],
        validFrom: json["valid_from"],
        validTill: json["valid_till"],
        openingBalance: json["opening_balance"] == null ? null : json["opening_balance"],
        closingBalance: json["closing_balance"] == null ? null : json["closing_balance"],
        balanceTotal: json["balance_total"] == null ? null : json["balance_total"],
        following: json["following"] == null ? null : json["following"],
        followers: json["followers"] == null ? null : json["followers"],
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
        "comp_id": compId == null ? null : compId,
        "company_name": companyName == null ? null : companyName,
        "membership_id": membershipId == null ? null : membershipId,
        "membership_name": membershipName == null ? null : membershipName,
        "country_code_id": countryCodeId == null ? null : countryCodeId,
        "system_user_type_id": systemUserTypeId == null ? null : systemUserTypeId,
        "full_name": fullName == null ? null : fullName,
        "display_name": displayName == null ? null : displayName,
        "bio": bio == null ? null : bio,
        "designation": designation,
        "gender": gender == null ? null : gender,
        "date_of_birth": dateOfBirth == null ? null : "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "cnic_no": cnicNo == null ? null : cnicNo,
        "username": username == null ? null : username,
        "img": img == null ? null : img,
        "signature_image": signatureImage,
        "slug": slug == null ? null : slug,
        "email": email == null ? null : email,
        "primary_email_code": primaryEmailCode == null ? null : primaryEmailCode,
        "primary_email_status": primaryEmailStatus == null ? null : primaryEmailStatus,
        "primary_number": primaryNumber == null ? null : primaryNumber,
        "primary_number_code": primaryNumberCode == null ? null : primaryNumberCode,
        "primary_number_status": primaryNumberStatus == null ? null : primaryNumberStatus,
        "password": password == null ? null : password,
        "remember_token": rememberToken,
        "live_status": liveStatus == null ? null : liveStatus,
        "points": points == null ? null : points,
        "about": about,
        "valid_from": validFrom,
        "valid_till": validTill,
        "opening_balance": openingBalance == null ? null : openingBalance,
        "closing_balance": closingBalance == null ? null : closingBalance,
        "balance_total": balanceTotal == null ? null : balanceTotal,
        "following": following == null ? null : following,
        "followers": followers == null ? null : followers,
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
