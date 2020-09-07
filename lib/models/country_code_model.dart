class CountryCodeModel {
  CountryCodeModel({
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

  factory CountryCodeModel.fromJson(Map<String, dynamic> json) =>
      CountryCodeModel(
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
    this.countryId,
    this.countryTitle,
    this.countrySlug,
    this.countryTwoLetterCode,
    this.countryThreeLetterCode,
    this.countryFlag,
    this.countryLatitude,
    this.countryLongitude,
    this.code,
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
  String countryId;
  String countryTitle;
  dynamic countrySlug;
  String countryTwoLetterCode;
  String countryThreeLetterCode;
  String countryFlag;
  String countryLatitude;
  String countryLongitude;
  String code;
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
        countryFlag: json["country_flag"] == null ? null : json["country_flag"],
        countryLatitude:
            json["country_latitude"] == null ? null : json["country_latitude"],
        countryLongitude: json["country_longitude"] == null
            ? null
            : json["country_longitude"],
        code: json["code"] == null ? null : json["code"],
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
        "country_id": countryId == null ? null : countryId,
        "country_title": countryTitle == null ? null : countryTitle,
        "country_slug": countrySlug,
        "country_two_letter_code":
            countryTwoLetterCode == null ? null : countryTwoLetterCode,
        "country_three_letter_code":
            countryThreeLetterCode == null ? null : countryThreeLetterCode,
        "country_flag": countryFlag == null ? null : countryFlag,
        "country_latitude": countryLatitude == null ? null : countryLatitude,
        "country_longitude": countryLongitude == null ? null : countryLongitude,
        "code": code == null ? null : code,
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
