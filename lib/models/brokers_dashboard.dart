class Brokers {
  Brokers({
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

  factory Brokers.fromJson(Map<String, dynamic> json) => Brokers(
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
  dynamic nextPageUrl;
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
        nextPageUrl: json["next_page_url"],
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
    this.brokerListingTypeId,
    this.brokerParentCategoryId,
    this.brokerChildCategoryId,
    this.brokerSubChildCategoryId,
    this.brokerTypeId,
    this.brokerTypeTitle,
    this.experienceId,
    this.experienceTitle,
    this.title,
    this.slug,
    this.about,
    this.tags,
    this.keyword,
    this.picture,
    this.openingBalance,
    this.closingBalance,
    this.balanceTotal,
    this.averageRating,
    this.noOfReviews,
    this.noOfBuy,
    this.noOfSell,
    this.noOfRent,
    this.noOfDeal,
    this.noOfDealCancel,
    this.cnic,
    this.noOfFollowers,
    this.noOfFollowing,
    this.licenseNo,
    this.licenseRegistrationDate,
    this.licenseExpiryDate,
    this.publishedDate,
    this.expiredDate,
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
    this.noOfViewEmail,
    this.noOfViewNumber,
    this.noOfSendEmail,
    this.status,
    this.orderBy,
    this.createdByCompId,
    this.companyName,
    this.companySlug,
    this.companyLogo,
    this.companyAbout,
    this.companyVerificationStatus,
    this.companyRating,
    this.companySlogan,
    this.companyNoOfReviews,
    this.companySince,
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
    this.provinceTitle,
    this.provinceSlug,
    this.provinceTwoLetterCode,
    this.provinceLatitude,
    this.provinceLongitude,
    this.cityName,
    this.cityLatitude,
    this.cityLongitude,
    this.areaName,
    this.areaLatitude,
    this.areaLongitude,
    this.locationName,
    this.locationLatitude,
    this.locationLongitude,
    this.contactEmailAddressesReferenceId,
    this.contactEmailAddressesReferenceType,
    this.contactEmail,
    this.contactEmailAddressesVerificationStatus,
    this.contactNumberReferenceId,
    this.contactNumberReferenceType,
    this.contactNumberTitle,
    this.contactNumber,
    this.contactNumberVerificationStatus,
    this.createdByUserId,
    this.updatedByUserId,
    this.deletedByUserId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.average_rating,
  });

  String id;
  String average_rating;
  dynamic brokerListingTypeId;
  dynamic brokerParentCategoryId;
  dynamic brokerChildCategoryId;
  dynamic brokerSubChildCategoryId;
  String brokerTypeId;
  String brokerTypeTitle;
  String experienceId;
  String experienceTitle;
  String title;
  String slug;
  dynamic about;
  dynamic tags;
  dynamic keyword;
  String picture;
  String openingBalance;
  String closingBalance;
  String balanceTotal;
  String averageRating;
  String noOfReviews;
  String noOfBuy;
  String noOfSell;
  String noOfRent;
  String noOfDeal;
  String noOfDealCancel;
  dynamic cnic;
  String noOfFollowers;
  String noOfFollowing;
  dynamic licenseNo;
  dynamic licenseRegistrationDate;
  dynamic licenseExpiryDate;
  dynamic publishedDate;
  dynamic expiredDate;
  dynamic lastRefreshedDate;
  dynamic lastListingTypeChangeDate;
  dynamic saveCount;
  dynamic refreshCount;
  dynamic imageCount;
  dynamic videoCount;
  dynamic fileCount;
  dynamic visitor;
  dynamic noOfLikes;
  dynamic noOfComments;
  dynamic noOfShare;
  dynamic noOfViewEmail;
  dynamic noOfViewNumber;
  dynamic noOfSendEmail;
  String status;
  dynamic orderBy;
  String createdByCompId;
  String companyName;
  String companySlug;
  dynamic companyLogo;
  dynamic companyAbout;
  String companyVerificationStatus;
  String companyRating;
  dynamic companySlogan;
  String companyNoOfReviews;
  dynamic companySince;
  String contactAddressId;
  String contactAddressCountryId;
  String contactAddressProvinceId;
  String contactAddressCityId;
  String contactAddressAreaId;
  String contactAddressLocationId;
  String contactAddressReferenceId;
  String contactAddressReferenceType;
  String contactAddressAddress;
  String contactAddressPostalCode;
  String contactAddressPostalLatitude;
  String contactAddressPostalLongitude;
  String contactAddressPostalStatus;
  String contactAddressVerificationStatus;
  String provinceTitle;
  dynamic provinceSlug;
  dynamic provinceTwoLetterCode;
  String provinceLatitude;
  String provinceLongitude;
  String cityName;
  String cityLatitude;
  String cityLongitude;
  String areaName;
  String areaLatitude;
  String areaLongitude;
  String locationName;
  String locationLatitude;
  String locationLongitude;
  dynamic contactEmailAddressesReferenceId;
  dynamic contactEmailAddressesReferenceType;
  dynamic contactEmail;
  dynamic contactEmailAddressesVerificationStatus;
  dynamic contactNumberReferenceId;
  dynamic contactNumberReferenceType;
  dynamic contactNumberTitle;
  dynamic contactNumber;
  dynamic contactNumberVerificationStatus;
  String createdByUserId;
  dynamic updatedByUserId;
  dynamic deletedByUserId;
  DateTime createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        brokerListingTypeId: json["broker_listing_type_id"],
        brokerParentCategoryId: json["broker_parent_category_id"],
        brokerChildCategoryId: json["broker_child_category_id"],
        brokerSubChildCategoryId: json["broker_sub_child_category_id"],
        brokerTypeId:
            json["broker_type_id"] == null ? null : json["broker_type_id"],
        brokerTypeTitle: json["broker_type_title"] == null
            ? null
            : json["broker_type_title"],
        experienceId:
            json["experience_id"] == null ? null : json["experience_id"],
        experienceTitle:
            json["experience_title"] == null ? null : json["experience_title"],
        title: json["title"] == null ? null : json["title"],
        slug: json["slug"] == null ? null : json["slug"],
        about: json["about"],
        tags: json["tags"],
        keyword: json["keyword"],
        picture: json["picture"] == null ? null : json["picture"],
        openingBalance:
            json["opening_balance"] == null ? null : json["opening_balance"],
        closingBalance:
            json["closing_balance"] == null ? null : json["closing_balance"],
        balanceTotal:
            json["balance_total"] == null ? null : json["balance_total"],
        averageRating:
            json["average_rating"] == null ? null : json["average_rating"],
        noOfReviews:
            json["no_of_reviews"] == null ? null : json["no_of_reviews"],
        noOfBuy: json["no_of_buy"] == null ? null : json["no_of_buy"],
        noOfSell: json["no_of_sell"] == null ? null : json["no_of_sell"],
        noOfRent: json["no_of_rent"] == null ? null : json["no_of_rent"],
        noOfDeal: json["no_of_deal"] == null ? null : json["no_of_deal"],
        noOfDealCancel: json["no_of_deal_cancel"] == null
            ? null
            : json["no_of_deal_cancel"],
        cnic: json["cnic"],
        noOfFollowers:
            json["no_of_followers"] == null ? null : json["no_of_followers"],
        noOfFollowing:
            json["no_of_following"] == null ? null : json["no_of_following"],
        licenseNo: json["license_no"],
        licenseRegistrationDate: json["license_registration_date"],
        licenseExpiryDate: json["license_expiry_date"],
        publishedDate: json["published_date"],
        expiredDate: json["expired_date"],
        lastRefreshedDate: json["last_refreshed_date"],
        lastListingTypeChangeDate: json["last_listing_type_change_date"],
        saveCount: json["save_count"],
        refreshCount: json["refresh_count"],
        imageCount: json["image_count"],
        videoCount: json["video_count"],
        fileCount: json["file_count"],
        visitor: json["visitor"],
        noOfLikes: json["no_of_likes"],
        noOfComments: json["no_of_comments"],
        noOfShare: json["no_of_share"],
        noOfViewEmail: json["no_of_view_email"],
        noOfViewNumber: json["no_of_view_number"],
        noOfSendEmail: json["no_of_send_email"],
        status: json["status"] == null ? null : json["status"],
        orderBy: json["order_by"],
        createdByCompId: json["created_by_comp_id"] == null
            ? null
            : json["created_by_comp_id"],
        companyName: json["company_name"] == null ? null : json["company_name"],
        companySlug: json["company_slug"] == null ? null : json["company_slug"],
        companyLogo: json["company_logo"],
        companyAbout: json["company_about"],
        companyVerificationStatus: json["company_verification_status"] == null
            ? null
            : json["company_verification_status"],
        companyRating:
            json["company_rating"] == null ? null : json["company_rating"],
        companySlogan: json["company_slogan"],
        companyNoOfReviews: json["company_no_of_reviews"] == null
            ? null
            : json["company_no_of_reviews"],
        companySince: json["company_since"],
        contactAddressId: json["contact_address_id"] == null
            ? null
            : json["contact_address_id"],
        contactAddressCountryId: json["contact_address_country_id"] == null
            ? null
            : json["contact_address_country_id"],
        contactAddressProvinceId: json["contact_address_province_id"] == null
            ? null
            : json["contact_address_province_id"],
        contactAddressCityId: json["contact_address_city_id"] == null
            ? null
            : json["contact_address_city_id"],
        contactAddressAreaId: json["contact_address_area_id"] == null
            ? null
            : json["contact_address_area_id"],
        contactAddressLocationId: json["contact_address_location_id"] == null
            ? null
            : json["contact_address_location_id"],
        contactAddressReferenceId: json["contact_address_reference_id"] == null
            ? null
            : json["contact_address_reference_id"],
        contactAddressReferenceType:
            json["contact_address_reference_type"] == null
                ? null
                : json["contact_address_reference_type"],
        contactAddressAddress: json["contact_address_address"] == null
            ? null
            : json["contact_address_address"],
        contactAddressPostalCode: json["contact_address_postal_code"] == null
            ? null
            : json["contact_address_postal_code"],
        contactAddressPostalLatitude:
            json["contact_address_postal_latitude"] == null
                ? null
                : json["contact_address_postal_latitude"],
        contactAddressPostalLongitude:
            json["contact_address_postal_longitude"] == null
                ? null
                : json["contact_address_postal_longitude"],
        contactAddressPostalStatus:
            json["contact_address_postal_status"] == null
                ? null
                : json["contact_address_postal_status"],
        contactAddressVerificationStatus:
            json["contact_address_verification_status"] == null
                ? null
                : json["contact_address_verification_status"],
        provinceTitle:
            json["province_title"] == null ? null : json["province_title"],
        provinceSlug: json["province_slug"],
        provinceTwoLetterCode: json["province_two_letter_code"],
        provinceLatitude: json["province_latitude"] == null
            ? null
            : json["province_latitude"],
        provinceLongitude: json["province_longitude"] == null
            ? null
            : json["province_longitude"],
        cityName: json["city_name"] == null ? null : json["city_name"],
        cityLatitude:
            json["city_latitude"] == null ? null : json["city_latitude"],
        cityLongitude:
            json["city_longitude"] == null ? null : json["city_longitude"],
        areaName: json["area_name"] == null ? null : json["area_name"],
        areaLatitude:
            json["area_latitude"] == null ? null : json["area_latitude"],
        areaLongitude:
            json["area_longitude"] == null ? null : json["area_longitude"],
        locationName:
            json["location_name"] == null ? null : json["location_name"],
        locationLatitude: json["location_latitude"] == null
            ? null
            : json["location_latitude"],
        locationLongitude: json["location_longitude"] == null
            ? null
            : json["location_longitude"],
        contactEmailAddressesReferenceId:
            json["contact_email_addresses_reference_id"],
        contactEmailAddressesReferenceType:
            json["contact_email_addresses_reference_type"],
        contactEmail: json["contact_email"],
        contactEmailAddressesVerificationStatus:
            json["contact_email_addresses_verification_status"],
        contactNumberReferenceId: json["contact_number_reference_id"],
        contactNumberReferenceType: json["contact_number_reference_type"],
        contactNumberTitle: json["contact_number_title"],
        contactNumber: json["contact_number"],
        contactNumberVerificationStatus:
            json["contact_number_verification_status"],
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
        average_rating: json["average_rating"] == null ? null : json["average_rating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "broker_listing_type_id": brokerListingTypeId,
        "broker_parent_category_id": brokerParentCategoryId,
        "broker_child_category_id": brokerChildCategoryId,
        "broker_sub_child_category_id": brokerSubChildCategoryId,
        "broker_type_id": brokerTypeId == null ? null : brokerTypeId,
        "broker_type_title": brokerTypeTitle == null ? null : brokerTypeTitle,
        "experience_id": experienceId == null ? null : experienceId,
        "experience_title": experienceTitle == null ? null : experienceTitle,
        "title": title == null ? null : title,
        "slug": slug == null ? null : slug,
        "about": about,
        "tags": tags,
        "keyword": keyword,
        "picture": picture == null ? null : picture,
        "opening_balance": openingBalance == null ? null : openingBalance,
        "closing_balance": closingBalance == null ? null : closingBalance,
        "balance_total": balanceTotal == null ? null : balanceTotal,
        "average_rating": averageRating == null ? null : averageRating,
        "no_of_reviews": noOfReviews == null ? null : noOfReviews,
        "no_of_buy": noOfBuy == null ? null : noOfBuy,
        "no_of_sell": noOfSell == null ? null : noOfSell,
        "no_of_rent": noOfRent == null ? null : noOfRent,
        "no_of_deal": noOfDeal == null ? null : noOfDeal,
        "no_of_deal_cancel": noOfDealCancel == null ? null : noOfDealCancel,
        "cnic": cnic,
        "no_of_followers": noOfFollowers == null ? null : noOfFollowers,
        "no_of_following": noOfFollowing == null ? null : noOfFollowing,
        "license_no": licenseNo,
        "license_registration_date": licenseRegistrationDate,
        "license_expiry_date": licenseExpiryDate,
        "published_date": publishedDate,
        "expired_date": expiredDate,
        "last_refreshed_date": lastRefreshedDate,
        "last_listing_type_change_date": lastListingTypeChangeDate,
        "save_count": saveCount,
        "refresh_count": refreshCount,
        "image_count": imageCount,
        "video_count": videoCount,
        "file_count": fileCount,
        "visitor": visitor,
        "no_of_likes": noOfLikes,
        "no_of_comments": noOfComments,
        "no_of_share": noOfShare,
        "no_of_view_email": noOfViewEmail,
        "no_of_view_number": noOfViewNumber,
        "no_of_send_email": noOfSendEmail,
        "status": status == null ? null : status,
        "order_by": orderBy,
        "created_by_comp_id": createdByCompId == null ? null : createdByCompId,
        "company_name": companyName == null ? null : companyName,
        "company_slug": companySlug == null ? null : companySlug,
        "company_logo": companyLogo,
        "company_about": companyAbout,
        "company_verification_status": companyVerificationStatus == null
            ? null
            : companyVerificationStatus,
        "company_rating": companyRating == null ? null : companyRating,
        "company_slogan": companySlogan,
        "company_no_of_reviews":
            companyNoOfReviews == null ? null : companyNoOfReviews,
        "company_since": companySince,
        "contact_address_id":
            contactAddressId == null ? null : contactAddressId,
        "contact_address_country_id":
            contactAddressCountryId == null ? null : contactAddressCountryId,
        "contact_address_province_id":
            contactAddressProvinceId == null ? null : contactAddressProvinceId,
        "contact_address_city_id":
            contactAddressCityId == null ? null : contactAddressCityId,
        "contact_address_area_id":
            contactAddressAreaId == null ? null : contactAddressAreaId,
        "contact_address_location_id":
            contactAddressLocationId == null ? null : contactAddressLocationId,
        "contact_address_reference_id": contactAddressReferenceId == null
            ? null
            : contactAddressReferenceId,
        "contact_address_reference_type": contactAddressReferenceType == null
            ? null
            : contactAddressReferenceType,
        "contact_address_address":
            contactAddressAddress == null ? null : contactAddressAddress,
        "contact_address_postal_code":
            contactAddressPostalCode == null ? null : contactAddressPostalCode,
        "contact_address_postal_latitude": contactAddressPostalLatitude == null
            ? null
            : contactAddressPostalLatitude,
        "contact_address_postal_longitude":
            contactAddressPostalLongitude == null
                ? null
                : contactAddressPostalLongitude,
        "contact_address_postal_status": contactAddressPostalStatus == null
            ? null
            : contactAddressPostalStatus,
        "contact_address_verification_status":
            contactAddressVerificationStatus == null
                ? null
                : contactAddressVerificationStatus,
        "province_title": provinceTitle == null ? null : provinceTitle,
        "province_slug": provinceSlug,
        "province_two_letter_code": provinceTwoLetterCode,
        "province_latitude": provinceLatitude == null ? null : provinceLatitude,
        "province_longitude":
            provinceLongitude == null ? null : provinceLongitude,
        "city_name": cityName == null ? null : cityName,
        "city_latitude": cityLatitude == null ? null : cityLatitude,
        "city_longitude": cityLongitude == null ? null : cityLongitude,
        "area_name": areaName == null ? null : areaName,
        "area_latitude": areaLatitude == null ? null : areaLatitude,
        "area_longitude": areaLongitude == null ? null : areaLongitude,
        "location_name": locationName == null ? null : locationName,
        "location_latitude": locationLatitude == null ? null : locationLatitude,
        "location_longitude":
            locationLongitude == null ? null : locationLongitude,
        "contact_email_addresses_reference_id":
            contactEmailAddressesReferenceId,
        "contact_email_addresses_reference_type":
            contactEmailAddressesReferenceType,
        "contact_email": contactEmail,
        "contact_email_addresses_verification_status":
            contactEmailAddressesVerificationStatus,
        "contact_number_reference_id": contactNumberReferenceId,
        "contact_number_reference_type": contactNumberReferenceType,
        "contact_number_title": contactNumberTitle,
        "contact_number": contactNumber,
        "contact_number_verification_status": contactNumberVerificationStatus,
        "created_by_user_id": createdByUserId == null ? null : createdByUserId,
        "updated_by_user_id": updatedByUserId,
        "deleted_by_user_id": deletedByUserId,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
        "average_rating": average_rating == null ? null : average_rating,
      };
}
