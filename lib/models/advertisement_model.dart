// To parse this JSON data, do
//
//     final advertisements = advertisementsFromJson(jsonString);

import 'dart:convert';

Advertisements advertisementsFromJson(String str) => Advertisements.fromJson(json.decode(str));

String advertisementsToJson(Advertisements data) => json.encode(data.toJson());

class Advertisements {
    Advertisements({
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

    factory Advertisements.fromJson(Map<String, dynamic> json) => Advertisements(
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
        this.title,
        this.slug,
        this.about,
        this.logo,
        this.url,
        this.type,
        this.banner,
        this.publishedDate,
        this.expiredDate,
        this.visitors,
        this.noOfClicks,
        this.impressions,
        this.budgets,
        this.balance,
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
        this.companySlogan,
        this.companyNoOfReviews,
        this.companySince,
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
    String title;
    String slug;
    dynamic about;
    dynamic logo;
    String url;
    String type;
    String banner;
    DateTime publishedDate;
    DateTime expiredDate;
    String visitors;
    String noOfClicks;
    String impressions;
    String budgets;
    String balance;
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
    dynamic companySlogan;
    String companyNoOfReviews;
    dynamic companySince;
    dynamic status;
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
        title: json["title"] == null ? null : json["title"],
        slug: json["slug"] == null ? null : json["slug"],
        about: json["about"],
        logo: json["logo"],
        url: json["url"] == null ? null : json["url"],
        type: json["type"] == null ? null : json["type"],
        banner: json["banner"] == null ? null : json["banner"],
        publishedDate: json["published_date"] == null ? null : DateTime.parse(json["published_date"]),
        expiredDate: json["expired_date"] == null ? null : DateTime.parse(json["expired_date"]),
        visitors: json["visitors"] == null ? null : json["visitors"],
        noOfClicks: json["no_of_clicks"] == null ? null : json["no_of_clicks"],
        impressions: json["impressions"] == null ? null : json["impressions"],
        budgets: json["budgets"] == null ? null : json["budgets"],
        balance: json["balance"] == null ? null : json["balance"],
        userFullName: json["user_full_name"] == null ? null : json["user_full_name"],
        userDisplayName: json["user_display_name"] == null ? null : json["user_display_name"],
        userImg: json["user_img"] == null ? null : json["user_img"],
        userTimezone: json["user_timezone"] == null ? null : json["user_timezone"],
        userSlug: json["user_slug"] == null ? null : json["user_slug"],
        companyTitle: json["company_title"] == null ? null : json["company_title"],
        companySlug: json["company_slug"] == null ? null : json["company_slug"],
        companyLogo: json["company_logo"],
        companyAbout: json["company_about"],
        companyVerificationStatus: json["company_verification_status"] == null ? null : json["company_verification_status"],
        companyRating: json["company_rating"] == null ? null : json["company_rating"],
        companySlogan: json["company_slogan"],
        companyNoOfReviews: json["company_no_of_reviews"] == null ? null : json["company_no_of_reviews"],
        companySince: json["company_since"],
        status: json["status"],
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
        "title": title == null ? null : title,
        "slug": slug == null ? null : slug,
        "about": about,
        "logo": logo,
        "url": url == null ? null : url,
        "type": type == null ? null : type,
        "banner": banner == null ? null : banner,
        "published_date": publishedDate == null ? null : publishedDate.toIso8601String(),
        "expired_date": expiredDate == null ? null : expiredDate.toIso8601String(),
        "visitors": visitors == null ? null : visitors,
        "no_of_clicks": noOfClicks == null ? null : noOfClicks,
        "impressions": impressions == null ? null : impressions,
        "budgets": budgets == null ? null : budgets,
        "balance": balance == null ? null : balance,
        "user_full_name": userFullName == null ? null : userFullName,
        "user_display_name": userDisplayName == null ? null : userDisplayName,
        "user_img": userImg == null ? null : userImg,
        "user_timezone": userTimezone == null ? null : userTimezone,
        "user_slug": userSlug == null ? null : userSlug,
        "company_title": companyTitle == null ? null : companyTitle,
        "company_slug": companySlug == null ? null : companySlug,
        "company_logo": companyLogo,
        "company_about": companyAbout,
        "company_verification_status": companyVerificationStatus == null ? null : companyVerificationStatus,
        "company_rating": companyRating == null ? null : companyRating,
        "company_slogan": companySlogan,
        "company_no_of_reviews": companyNoOfReviews == null ? null : companyNoOfReviews,
        "company_since": companySince,
        "status": status,
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
