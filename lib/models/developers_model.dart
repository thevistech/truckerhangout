// To parse this JSON data, do
//
//     final developerModel = developerModelFromJson(jsonString);

import 'dart:convert';

DeveloperModel developerModelFromJson(String str) =>
    DeveloperModel.fromJson(json.decode(str));

String developerModelToJson(DeveloperModel data) => json.encode(data.toJson());

class DeveloperModel {
  DeveloperModel({
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

  factory DeveloperModel.fromJson(Map<String, dynamic> json) => DeveloperModel(
        error: json["error"] == null ? null : json["error"],
        code: json["code"] == null ? null : json["code"],
        message: json["message"] == null ? null : json["message"],
        url: json["url"] == null ? null : json["url"],
        noOfRecords:
            json["no_of_records"] == null ? null : json["no_of_records"],
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
  String nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"] == null ? null : json["current_page"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        from: json["from"] == null ? null : json["from"],
        lastPage: json["last_page"] == null ? null : json["last_page"],
        nextPageUrl:
            json["next_page_url"] == null ? null : json["next_page_url"],
        path: json["path"] == null ? null : json["path"],
        perPage: json["per_page"] == null ? null : json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"] == null ? null : json["to"],
        total: json["total"] == null ? null : json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage == null ? null : currentPage,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
        "from": from == null ? null : from,
        "last_page": lastPage == null ? null : lastPage,
        "next_page_url": nextPageUrl == null ? null : nextPageUrl,
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
    this.listingTypeId,
    this.listingTypeTitle,
    this.listingTypeSlug,
    this.parentCategoryId,
    this.parentCategoryTitle,
    this.parentCategorySlug,
    this.childCategoryId,
    this.childCategoryTitle,
    this.childCategorySlug,
    this.subChildCategoryId,
    this.subChildCategoryTitle,
    this.subChildCategorySlug,
    this.industryTypeId,
    this.industryTypeTitle,
    this.industryTypeSlug,
    this.compTypeId,
    this.compTypeTitle,
    this.compTypeSlug,
    this.compRulGpNamId,
    this.companyRulesGroupTitle,
    this.membershipId,
    this.membershipTitle,
    this.companySizeId,
    this.companySizeTitle,
    this.name,
    this.slug,
    this.logo,
    this.regNo,
    this.about,
    this.points,
    this.openingBalance,
    this.closingBalance,
    this.balanceTotal,
    this.verificationStatus,
    this.validFrom,
    this.validTill,
    this.rating,
    this.shortTermsAndConditions,
    this.detailTermsAndConditions,
    this.slogan,
    this.noOfReviews,
    this.noOfBuy,
    this.noOfSell,
    this.noOfRent,
    this.noOfDeal,
    this.noOfEmployee,
    this.noOfDealCancel,
    this.noOfFollowers,
    this.noOfFollowing,
    this.noOfJob,
    this.since,
    this.expertise,
    this.publishedDate,
    this.lastRefreshedDate,
    this.lastListingTypeChangeDate,
    this.saveCount,
    this.refreshCount,
    this.imageCount,
    this.videoCount,
    this.fileCount,
    this.visitor,
    this.noOfLikes,
    this.noOfComments,
    this.noOfShare,
    this.noOfContact,
    this.tag,
    this.keyword,
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
    this.updatedAt,
    this.deletedAt,
  });

  String id;
  String listingTypeId;
  String listingTypeTitle;
  String listingTypeSlug;
  String parentCategoryId;
  String parentCategoryTitle;
  String parentCategorySlug;
  dynamic childCategoryId;
  dynamic childCategoryTitle;
  dynamic childCategorySlug;
  dynamic subChildCategoryId;
  dynamic subChildCategoryTitle;
  dynamic subChildCategorySlug;
  String industryTypeId;
  String industryTypeTitle;
  String industryTypeSlug;
  String compTypeId;
  String compTypeTitle;
  String compTypeSlug;
  String compRulGpNamId;
  String companyRulesGroupTitle;
  String membershipId;
  String membershipTitle;
  String companySizeId;
  String companySizeTitle;
  String name;
  String slug;
  String logo;
  dynamic regNo;
  String about;
  String points;
  String openingBalance;
  String closingBalance;
  String balanceTotal;
  String verificationStatus;
  DateTime validFrom;
  DateTime validTill;
  String rating;
  dynamic shortTermsAndConditions;
  dynamic detailTermsAndConditions;
  dynamic slogan;
  String noOfReviews;
  String noOfBuy;
  String noOfSell;
  String noOfRent;
  String noOfDeal;
  String noOfEmployee;
  String noOfDealCancel;
  String noOfFollowers;
  String noOfFollowing;
  String noOfJob;
  dynamic since;
  dynamic expertise;
  DateTime publishedDate;
  DateTime lastRefreshedDate;
  DateTime lastListingTypeChangeDate;
  String saveCount;
  String refreshCount;
  String imageCount;
  String videoCount;
  String fileCount;
  String visitor;
  String noOfLikes;
  String noOfComments;
  String noOfShare;
  String noOfContact;
  dynamic tag;
  dynamic keyword;
  String userFullName;
  String userDisplayName;
  String userImg;
  dynamic userTimezone;
  String userSlug;
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
        listingTypeId:
            json["listing_type_id"] == null ? null : json["listing_type_id"],
        listingTypeTitle: json["listing_type_title"] == null
            ? null
            : json["listing_type_title"],
        listingTypeSlug: json["listing_type_slug"] == null
            ? null
            : json["listing_type_slug"],
        parentCategoryId: json["parent_category_id"] == null
            ? null
            : json["parent_category_id"],
        parentCategoryTitle: json["parent_category_title"] == null
            ? null
            : json["parent_category_title"],
        parentCategorySlug: json["parent_category_slug"] == null
            ? null
            : json["parent_category_slug"],
        childCategoryId: json["child_category_id"],
        childCategoryTitle: json["child_category_title"],
        childCategorySlug: json["child_category_slug"],
        subChildCategoryId: json["sub_child_category_id"],
        subChildCategoryTitle: json["sub_child_category_title"],
        subChildCategorySlug: json["sub_child_category_slug"],
        industryTypeId:
            json["industry_type_id"] == null ? null : json["industry_type_id"],
        industryTypeTitle: json["industry_type_title"] == null
            ? null
            : json["industry_type_title"],
        industryTypeSlug: json["industry_type_slug"] == null
            ? null
            : json["industry_type_slug"],
        compTypeId: json["comp_type_id"] == null ? null : json["comp_type_id"],
        compTypeTitle:
            json["comp_type_title"] == null ? null : json["comp_type_title"],
        compTypeSlug:
            json["comp_type_slug"] == null ? null : json["comp_type_slug"],
        compRulGpNamId: json["comp_rul_gp_nam_id"] == null
            ? null
            : json["comp_rul_gp_nam_id"],
        companyRulesGroupTitle: json["company_rules_group_title"] == null
            ? null
            : json["company_rules_group_title"],
        membershipId:
            json["membership_id"] == null ? null : json["membership_id"],
        membershipTitle:
            json["membership_title"] == null ? null : json["membership_title"],
        companySizeId:
            json["company_size_id"] == null ? null : json["company_size_id"],
        companySizeTitle: json["company_size_title"] == null
            ? null
            : json["company_size_title"],
        name: json["name"] == null ? null : json["name"],
        slug: json["slug"] == null ? null : json["slug"],
        logo: json["logo"] == null ? null : json["logo"],
        regNo: json["reg_no"],
        about: json["about"] == null ? null : json["about"],
        points: json["points"] == null ? null : json["points"],
        openingBalance:
            json["opening_balance"] == null ? null : json["opening_balance"],
        closingBalance:
            json["closing_balance"] == null ? null : json["closing_balance"],
        balanceTotal:
            json["balance_total"] == null ? null : json["balance_total"],
        verificationStatus: json["verification_status"] == null
            ? null
            : json["verification_status"],
        validFrom: json["valid_from"] == null
            ? null
            : DateTime.parse(json["valid_from"]),
        validTill: json["valid_till"] == null
            ? null
            : DateTime.parse(json["valid_till"]),
        rating: json["rating"] == null ? null : json["rating"],
        shortTermsAndConditions: json["short_terms_and_conditions"],
        detailTermsAndConditions: json["detail_terms_and_conditions"],
        slogan: json["slogan"],
        noOfReviews:
            json["no_of_reviews"] == null ? null : json["no_of_reviews"],
        noOfBuy: json["no_of_buy"] == null ? null : json["no_of_buy"],
        noOfSell: json["no_of_sell"] == null ? null : json["no_of_sell"],
        noOfRent: json["no_of_rent"] == null ? null : json["no_of_rent"],
        noOfDeal: json["no_of_deal"] == null ? null : json["no_of_deal"],
        noOfEmployee:
            json["no_of_employee"] == null ? null : json["no_of_employee"],
        noOfDealCancel: json["no_of_deal_cancel"] == null
            ? null
            : json["no_of_deal_cancel"],
        noOfFollowers:
            json["no_of_followers"] == null ? null : json["no_of_followers"],
        noOfFollowing:
            json["no_of_following"] == null ? null : json["no_of_following"],
        noOfJob: json["no_of_job"] == null ? null : json["no_of_job"],
        since: json["since"],
        expertise: json["expertise"],
        publishedDate: json["published_date"] == null
            ? null
            : DateTime.parse(json["published_date"]),
        lastRefreshedDate: json["last_refreshed_date"] == null
            ? null
            : DateTime.parse(json["last_refreshed_date"]),
        lastListingTypeChangeDate: json["last_listing_type_change_date"] == null
            ? null
            : DateTime.parse(json["last_listing_type_change_date"]),
        saveCount: json["save_count"] == null ? null : json["save_count"],
        refreshCount:
            json["refresh_count"] == null ? null : json["refresh_count"],
        imageCount: json["image_count"] == null ? null : json["image_count"],
        videoCount: json["video_count"] == null ? null : json["video_count"],
        fileCount: json["file_count"] == null ? null : json["file_count"],
        visitor: json["visitor"] == null ? null : json["visitor"],
        noOfLikes: json["no_of_likes"] == null ? null : json["no_of_likes"],
        noOfComments:
            json["no_of_comments"] == null ? null : json["no_of_comments"],
        noOfShare: json["no_of_share"] == null ? null : json["no_of_share"],
        noOfContact:
            json["no_of_contact"] == null ? null : json["no_of_contact"],
        tag: json["tag"],
        keyword: json["keyword"],
        userFullName:
            json["user_full_name"] == null ? null : json["user_full_name"],
        userDisplayName: json["user_display_name"] == null
            ? null
            : json["user_display_name"],
        userImg: json["user_img"] == null ? null : json["user_img"],
        userTimezone: json["user_timezone"],
        userSlug: json["user_slug"] == null ? null : json["user_slug"],
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
        "listing_type_id": listingTypeId == null ? null : listingTypeId,
        "listing_type_title":
            listingTypeTitle == null ? null : listingTypeTitle,
        "listing_type_slug": listingTypeSlug == null ? null : listingTypeSlug,
        "parent_category_id":
            parentCategoryId == null ? null : parentCategoryId,
        "parent_category_title":
            parentCategoryTitle == null ? null : parentCategoryTitle,
        "parent_category_slug":
            parentCategorySlug == null ? null : parentCategorySlug,
        "child_category_id": childCategoryId,
        "child_category_title": childCategoryTitle,
        "child_category_slug": childCategorySlug,
        "sub_child_category_id": subChildCategoryId,
        "sub_child_category_title": subChildCategoryTitle,
        "sub_child_category_slug": subChildCategorySlug,
        "industry_type_id": industryTypeId == null ? null : industryTypeId,
        "industry_type_title":
            industryTypeTitle == null ? null : industryTypeTitle,
        "industry_type_slug":
            industryTypeSlug == null ? null : industryTypeSlug,
        "comp_type_id": compTypeId == null ? null : compTypeId,
        "comp_type_title": compTypeTitle == null ? null : compTypeTitle,
        "comp_type_slug": compTypeSlug == null ? null : compTypeSlug,
        "comp_rul_gp_nam_id": compRulGpNamId == null ? null : compRulGpNamId,
        "company_rules_group_title":
            companyRulesGroupTitle == null ? null : companyRulesGroupTitle,
        "membership_id": membershipId == null ? null : membershipId,
        "membership_title": membershipTitle == null ? null : membershipTitle,
        "company_size_id": companySizeId == null ? null : companySizeId,
        "company_size_title":
            companySizeTitle == null ? null : companySizeTitle,
        "name": name == null ? null : name,
        "slug": slug == null ? null : slug,
        "logo": logo == null ? null : logo,
        "reg_no": regNo,
        "about": about == null ? null : about,
        "points": points == null ? null : points,
        "opening_balance": openingBalance == null ? null : openingBalance,
        "closing_balance": closingBalance == null ? null : closingBalance,
        "balance_total": balanceTotal == null ? null : balanceTotal,
        "verification_status":
            verificationStatus == null ? null : verificationStatus,
        "valid_from": validFrom == null ? null : validFrom.toIso8601String(),
        "valid_till": validTill == null ? null : validTill.toIso8601String(),
        "rating": rating == null ? null : rating,
        "short_terms_and_conditions": shortTermsAndConditions,
        "detail_terms_and_conditions": detailTermsAndConditions,
        "slogan": slogan,
        "no_of_reviews": noOfReviews == null ? null : noOfReviews,
        "no_of_buy": noOfBuy == null ? null : noOfBuy,
        "no_of_sell": noOfSell == null ? null : noOfSell,
        "no_of_rent": noOfRent == null ? null : noOfRent,
        "no_of_deal": noOfDeal == null ? null : noOfDeal,
        "no_of_employee": noOfEmployee == null ? null : noOfEmployee,
        "no_of_deal_cancel": noOfDealCancel == null ? null : noOfDealCancel,
        "no_of_followers": noOfFollowers == null ? null : noOfFollowers,
        "no_of_following": noOfFollowing == null ? null : noOfFollowing,
        "no_of_job": noOfJob == null ? null : noOfJob,
        "since": since,
        "expertise": expertise,
        "published_date":
            publishedDate == null ? null : publishedDate.toIso8601String(),
        "last_refreshed_date": lastRefreshedDate == null
            ? null
            : lastRefreshedDate.toIso8601String(),
        "last_listing_type_change_date": lastListingTypeChangeDate == null
            ? null
            : lastListingTypeChangeDate.toIso8601String(),
        "save_count": saveCount == null ? null : saveCount,
        "refresh_count": refreshCount == null ? null : refreshCount,
        "image_count": imageCount == null ? null : imageCount,
        "video_count": videoCount == null ? null : videoCount,
        "file_count": fileCount == null ? null : fileCount,
        "visitor": visitor == null ? null : visitor,
        "no_of_likes": noOfLikes == null ? null : noOfLikes,
        "no_of_comments": noOfComments == null ? null : noOfComments,
        "no_of_share": noOfShare == null ? null : noOfShare,
        "no_of_contact": noOfContact == null ? null : noOfContact,
        "tag": tag,
        "keyword": keyword,
        "user_full_name": userFullName == null ? null : userFullName,
        "user_display_name": userDisplayName == null ? null : userDisplayName,
        "user_img": userImg == null ? null : userImg,
        "user_timezone": userTimezone,
        "user_slug": userSlug == null ? null : userSlug,
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
