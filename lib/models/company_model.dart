// To parse this JSON data, do
//
//     final companyDialog = companyDialogFromJson(jsonString);

class CompanyDialog {
  CompanyDialog({
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

  factory CompanyDialog.fromJson(Map<String, dynamic> json) => CompanyDialog(
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
    this.id,
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
    this.about,
    this.slogan,
    this.noOfReviews,
    this.noOfJob,
    this.publishedDate,
    this.userFullName,
    this.userDisplayName,
    this.userImg,
    this.userTimezone,
    this.userSlug,
    this.contactAddressId,
    this.contactAddressCountryId,
    this.contactAddressProvinceId,
    this.contactAddressCityId,
    this.contactAddressPostalStatus,
    this.contactAddressVerificationStatus,
    this.provincesTitle,
    this.provincesTwoLetterCode,
    this.cityName,
    this.status,
    this.createdAt,
  });

  String id;
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
  String about;
  String slogan;
  String noOfReviews;
  String noOfJob;
  DateTime publishedDate;
  String userFullName;
  String userDisplayName;
  String userImg;
  String userTimezone;
  String userSlug;
  String contactAddressId;
  String contactAddressCountryId;
  String contactAddressProvinceId;
  String contactAddressCityId;
  String contactAddressPostalStatus;
  String contactAddressVerificationStatus;
  String provincesTitle;
  String provincesTwoLetterCode;
  String cityName;
  String status;
  DateTime createdAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
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
        about: json["about"] == null ? null : json["about"],
        slogan: json["slogan"] == null ? null : json["slogan"],
        noOfReviews:
            json["no_of_reviews"] == null ? null : json["no_of_reviews"],
        noOfJob: json["no_of_job"] == null ? null : json["no_of_job"],
        publishedDate: json["published_date"] == null
            ? null
            : DateTime.parse(json["published_date"]),
        userFullName:
            json["user_full_name"] == null ? null : json["user_full_name"],
        userDisplayName: json["user_display_name"] == null
            ? null
            : json["user_display_name"],
        userImg: json["user_img"] == null ? null : json["user_img"],
        userTimezone:
            json["user_timezone"] == null ? null : json["user_timezone"],
        userSlug: json["user_slug"] == null ? null : json["user_slug"],
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
        contactAddressPostalStatus:
            json["contact_address_postal_status"] == null
                ? null
                : json["contact_address_postal_status"],
        contactAddressVerificationStatus:
            json["contact_address_verification_status"] == null
                ? null
                : json["contact_address_verification_status"],
        provincesTitle:
            json["provinces_title"] == null ? null : json["provinces_title"],
        provincesTwoLetterCode: json["provinces_two_letter_code"] == null
            ? null
            : json["provinces_two_letter_code"],
        cityName: json["city_name"] == null ? null : json["city_name"],
        status: json["status"] == null ? null : json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
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
        "about": about == null ? null : about,
        "slogan": slogan == null ? null : slogan,
        "no_of_reviews": noOfReviews == null ? null : noOfReviews,
        "no_of_job": noOfJob == null ? null : noOfJob,
        "published_date":
            publishedDate == null ? null : publishedDate.toIso8601String(),
        "user_full_name": userFullName == null ? null : userFullName,
        "user_display_name": userDisplayName == null ? null : userDisplayName,
        "user_img": userImg == null ? null : userImg,
        "user_timezone": userTimezone == null ? null : userTimezone,
        "user_slug": userSlug == null ? null : userSlug,
        "contact_address_id":
            contactAddressId == null ? null : contactAddressId,
        "contact_address_country_id":
            contactAddressCountryId == null ? null : contactAddressCountryId,
        "contact_address_province_id":
            contactAddressProvinceId == null ? null : contactAddressProvinceId,
        "contact_address_city_id":
            contactAddressCityId == null ? null : contactAddressCityId,
        "contact_address_postal_status": contactAddressPostalStatus == null
            ? null
            : contactAddressPostalStatus,
        "contact_address_verification_status":
            contactAddressVerificationStatus == null
                ? null
                : contactAddressVerificationStatus,
        "provinces_title": provincesTitle == null ? null : provincesTitle,
        "provinces_two_letter_code":
            provincesTwoLetterCode == null ? null : provincesTwoLetterCode,
        "city_name": cityName == null ? null : cityName,
        "status": status == null ? null : status,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
      };
}
