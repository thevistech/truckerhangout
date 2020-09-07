// To parse this JSON data, do
//
//     final filterPropertyModel = filterPropertyModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutterapp/models/post_model.dart';
import 'package:flutterapp/utills/dialog_helper.dart';

FilterPropertyModel filterPropertyModelFromJson(String str) =>
    FilterPropertyModel.fromJson(json.decode(str));

String filterPropertyModelToJson(FilterPropertyModel data) =>
    json.encode(data.toJson());

class FilterPropertyModel {
  FilterPropertyModel({
    this.error,
    this.code,
    this.message,
    this.url,
    this.data,
  });

  String error;
  String code;
  String message;
  String url;
  Data data;

  factory FilterPropertyModel.fromJson(Map<String, dynamic> json) =>
      FilterPropertyModel(
        error: json["error"] == null ? null : json["error"],
        code: json["code"] == null ? null : json["code"],
        message: json["message"] == null ? null : json["message"],
        url: json["url"] == null ? null : json["url"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error == null ? null : error,
        "code": code == null ? null : code,
        "message": message == null ? null : message,
        "url": url == null ? null : url,
        "data": data == null ? null : data.toJson(),
      };
}

class Data {
  Data({
    this.purposes,
    this.categories,
    this.countries,
    this.provinces,
    this.cities,
    this.areas,
    this.locations,
    this.propertyListingTypes,
    this.propertyPurposes,
    this.propertyPurposeTypes,
    this.propertyParentCategory,
    this.propertySubChildCategory,
    this.propertyChildCategory,
    this.units,
    this.currencies,
    this.bedroomRanges,
    this.bathRanges,
    this.minPrices,
    this.maxPrices,
    this.minAreas,
    this.maxAreas,
    this.minPrice,
    this.maxPrice,
    this.propertyFeatures,
    this.propertyNearBy,
    this.developers,
    this.user,
    this.friends,

  });

  List<Purpose> purposes;
  List<Category> categories;
  List<Country> countries;
  List<Province> provinces;
  List<City> cities;
  List<Area> areas;
  List<Location> locations;
  List<Map<String, String>> propertyListingTypes;
  List<Map<String, String>> propertyPurposes;
  List<Map<String, String>> propertyPurposeTypes;
  List<Map<String, String>> propertyParentCategory;
  List<dynamic> propertySubChildCategory;
  List<Map<String, String>> propertyChildCategory;
  List<Unit> units;
  List<Currency> currencies;
  List<BathRange> bedroomRanges;
  List<BathRange> bathRanges;
  List<BathRange> minPrices;
  List<BathRange> maxPrices;
  List<BathRange> minAreas;
  List<BathRange> maxAreas;
  int minPrice;
  int maxPrice;
  List<PropertyFeatureAndNearBy> propertyFeatures;
  List<PropertyFeatureAndNearBy> propertyNearBy;
  Developers developers;
  User user;
  Friends friends;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        purposes: json["Purposes"] == null
            ? null
            : List<Purpose>.from(
                json["Purposes"].map((x) => Purpose.fromJson(x))),
        categories: json["Categories"] == null
            ? null
            : List<Category>.from(
                json["Categories"].map((x) => Category.fromJson(x))),
        countries: json["Countries"] == null
            ? null
            : List<Country>.from(
                json["Countries"].map((x) => Country.fromJson(x))),
        provinces: json["Provinces"] == null
            ? null
            : List<Province>.from(
                json["Provinces"].map((x) => Province.fromJson(x))),
        cities: json["Cities"] == null
            ? null
            : List<City>.from(json["Cities"].map((x) => City.fromJson(x))),
        areas: json["Areas"] == null
            ? null
            : List<Area>.from(json["Areas"].map((x) => Area.fromJson(x))),
        locations: json["Locations"] == null
            ? null
            : List<Location>.from(
                json["Locations"].map((x) => Location.fromJson(x))),
        propertyListingTypes: json["PropertyListingTypes"] == null
            ? null
            : List<Map<String, String>>.from(json["PropertyListingTypes"].map(
                (x) => Map.from(x).map((k, v) =>
                    MapEntry<String, String>(k, v == null ? null : v)))),
        propertyPurposes: json["PropertyPurposes"] == null
            ? null
            : List<Map<String, String>>.from(json["PropertyPurposes"].map((x) =>
                Map.from(x).map((k, v) =>
                    MapEntry<String, String>(k, v == null ? null : v)))),
        propertyPurposeTypes: json["PropertyPurposeTypes"] == null
            ? null
            : List<Map<String, String>>.from(json["PropertyPurposeTypes"].map(
                (x) => Map.from(x).map((k, v) =>
                    MapEntry<String, String>(k, v == null ? null : v)))),
        propertySubChildCategory: json["PropertySubChildCategory"] == null
            ? null
            : List<dynamic>.from(
                json["PropertySubChildCategory"].map((x) => x)),
        propertyChildCategory: json["PropertyChildCategory"] == null
            ? null
            : List<Map<String, String>>.from(json["PropertyChildCategory"].map(
                (x) => Map.from(x).map((k, v) =>
                    MapEntry<String, String>(k, v == null ? null : v)))),
        units: json["Units"] == null
            ? null
            : List<Unit>.from(json["Units"].map((x) => Unit.fromJson(x))),
        currencies: json["Currencies"] == null
            ? null
            : List<Currency>.from(
                json["Currencies"].map((x) => Currency.fromJson(x))),
        bedroomRanges: json["BedroomRanges"] == null
            ? null
            : List<BathRange>.from(
                json["BedroomRanges"].map((x) => BathRange.fromJson(x))),
        bathRanges: json["BathRanges"] == null
            ? null
            : List<BathRange>.from(
                json["BathRanges"].map((x) => BathRange.fromJson(x))),
        minPrices: json["MinPrices"] == null
            ? null
            : List<BathRange>.from(
                json["MinPrices"].map((x) => BathRange.fromJson(x))),
        maxPrices: json["MaxPrices"] == null
            ? null
            : List<BathRange>.from(
                json["MaxPrices"].map((x) => BathRange.fromJson(x))),
        minAreas: json["MinAreas"] == null
            ? null
            : List<BathRange>.from(
                json["MinAreas"].map((x) => BathRange.fromJson(x))),
        maxAreas: json["MaxAreas"] == null
            ? null
            : List<BathRange>.from(
                json["MaxAreas"].map((x) => BathRange.fromJson(x))),
        minPrice: json["min_price"] == null ? null : json["min_price"],
        maxPrice: json["max_price"] == null ? null : json["max_price"],
        propertyFeatures: json["PropertyFeatures"] == null
            ? null
            : List<PropertyFeatureAndNearBy>.from(json["PropertyFeatures"]
                .map((x) => PropertyFeatureAndNearBy.fromJson(x))),
        propertyNearBy: json["PropertyNearBy"] == null
            ? null
            : List<PropertyFeatureAndNearBy>.from(json["PropertyNearBy"]
                .map((x) => PropertyFeatureAndNearBy.fromJson(x))),
        developers: json["Developers"] == null
            ? null
            : Developers.fromJson(json["Developers"]),
        user: User.fromJson(json["User"]),
        friends: Friends.fromJson(json["Friends"]),


  );

  Map<String, dynamic> toJson() => {
        "Purposes": purposes == null
            ? null
            : List<dynamic>.from(purposes.map((x) => x.toJson())),
        "Categories": categories == null
            ? null
            : List<dynamic>.from(categories.map((x) => x.toJson())),
        "Countries": countries == null
            ? null
            : List<dynamic>.from(countries.map((x) => x.toJson())),
        "Provinces": provinces == null
            ? null
            : List<dynamic>.from(provinces.map((x) => x.toJson())),
        "Cities": cities == null
            ? null
            : List<dynamic>.from(cities.map((x) => x.toJson())),
        "Areas": areas == null
            ? null
            : List<dynamic>.from(areas.map((x) => x.toJson())),
        "Locations": locations == null
            ? null
            : List<dynamic>.from(locations.map((x) => x.toJson())),
        "PropertyListingTypes": propertyListingTypes == null
            ? null
            : List<dynamic>.from(propertyListingTypes.map((x) => Map.from(x)
                .map((k, v) =>
                    MapEntry<String, dynamic>(k, v == null ? null : v)))),
        "PropertyPurposes": propertyPurposes == null
            ? null
            : List<dynamic>.from(propertyPurposes.map((x) => Map.from(x).map(
                (k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)))),
        "PropertyPurposeTypes": propertyPurposeTypes == null
            ? null
            : List<dynamic>.from(propertyPurposeTypes.map((x) => Map.from(x)
                .map((k, v) =>
                    MapEntry<String, dynamic>(k, v == null ? null : v)))),
        "PropertyParentCategory": propertyParentCategory == null
            ? null
            : List<dynamic>.from(propertyParentCategory.map((x) => Map.from(x)
                .map((k, v) =>
                    MapEntry<String, dynamic>(k, v == null ? null : v)))),
        "PropertySubChildCategory": propertySubChildCategory == null
            ? null
            : List<dynamic>.from(propertySubChildCategory.map((x) => x)),
        "PropertyChildCategory": propertyChildCategory == null
            ? null
            : List<dynamic>.from(propertyChildCategory.map((x) => Map.from(x)
                .map((k, v) =>
                    MapEntry<String, dynamic>(k, v == null ? null : v)))),
        "Units": units == null
            ? null
            : List<dynamic>.from(units.map((x) => x.toJson())),
        "Currencies": currencies == null
            ? null
            : List<dynamic>.from(currencies.map((x) => x.toJson())),
        "BedroomRanges": bedroomRanges == null
            ? null
            : List<dynamic>.from(bedroomRanges.map((x) => x.toJson())),
        "BathRanges": bathRanges == null
            ? null
            : List<dynamic>.from(bathRanges.map((x) => x.toJson())),
        "MinPrices": minPrices == null
            ? null
            : List<dynamic>.from(minPrices.map((x) => x.toJson())),
        "MaxPrices": maxPrices == null
            ? null
            : List<dynamic>.from(maxPrices.map((x) => x.toJson())),
        "MinAreas": minAreas == null
            ? null
            : List<dynamic>.from(minAreas.map((x) => x.toJson())),
        "MaxAreas": maxAreas == null
            ? null
            : List<dynamic>.from(maxAreas.map((x) => x.toJson())),
        "min_price": minPrice == null ? null : minPrice,
        "max_price": maxPrice == null ? null : maxPrice,
        "PropertyFeatures": propertyFeatures == null
            ? null
            : List<dynamic>.from(propertyFeatures.map((x) => x.toJson())),
        "PropertyNearBy": propertyNearBy == null
            ? null
            : List<dynamic>.from(propertyNearBy.map((x) => x.toJson())),
        "Developers": developers == null ? null : developers.toJson(),
        "User": user.toJson(),
       "Friends": friends.toJson(),

  };
}

class BathRange {
  BathRange({
    this.value,
    this.text,
  });

  String value;
  String text;

  factory BathRange.fromJson(Map<String, dynamic> json) => BathRange(
        value: json["value"] == null ? null : json["value"],
        text: json["text"] == null ? null : json["text"],
      );

  Map<String, dynamic> toJson() => {
        "value": value == null ? null : value,
        "text": text == null ? null : text,
      };
}

class Category {
  Category({
    this.parent,
    this.childes,
  });

  Parent parent;
  List<Childe> childes;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        parent: json["Parent"] == null ? null : Parent.fromJson(json["Parent"]),
        childes: json["Childes"] == null
            ? null
            : List<Childe>.from(json["Childes"].map((x) => Childe.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Parent": parent == null ? null : parent.toJson(),
        "Childes": childes == null
            ? null
            : List<dynamic>.from(childes.map((x) => x.toJson())),
      };
}

class Childe {
  Childe({
    this.child,
    this.subChildes,
  });

  Child child;
  SubChildes subChildes;

  factory Childe.fromJson(Map<String, dynamic> json) => Childe(
        child: json["Child"] == null ? null : Child.fromJson(json["Child"]),
        // subChildes: json["SubChildes"] == null
        //     ? null
        //     : SubChildes.fromJson(json["SubChildes"]),
      );

  Map<String, dynamic> toJson() => {
        "Child": child == null ? null : child.toJson(),
        // "SubChildes": subChildes == null ? null : subChildes.toJson(),
      };
}

class Child {
  Child({
    this.id,
    this.propertyParentCategoryId,
    this.propertyParentCategoryTitle,
    this.title,
    this.slug,
    this.image,
    this.status,
    this.orderBy,
  });

  String id;
  String propertyParentCategoryId;
  String propertyParentCategoryTitle;
  String title;
  dynamic slug;
  String image;
  String status;
  dynamic orderBy;

  factory Child.fromJson(Map<String, dynamic> json) => Child(
        id: json["id"] == null ? null : json["id"],
        propertyParentCategoryId: json["property_parent_category_id"] == null
            ? null
            : json["property_parent_category_id"],
        propertyParentCategoryTitle:
            json["property_parent_category_title"] == null
                ? null
                : json["property_parent_category_title"],
        title: json["title"] == null ? null : json["title"],
        slug: json["slug"],
        image: json["image"],
        status: json["status"] == null ? null : json["status"],
        orderBy: json["order_by"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "property_parent_category_id":
            propertyParentCategoryId == null ? null : propertyParentCategoryId,
        "property_parent_category_title": propertyParentCategoryTitle == null
            ? null
            : propertyParentCategoryTitle,
        "title": title == null ? null : title,
        "slug": slug,
        "image": image,
        "status": status == null ? null : status,
        "order_by": orderBy,
      };
}

class SubChildes {
  SubChildes({
    this.the1,
  });

  The1 the1;

  factory SubChildes.fromJson(Map<String, dynamic> json) => SubChildes(
        the1: json["1"] == null ? null : The1.fromJson(json[0]),
      );

  Map<String, dynamic> toJson() => {
        "1": the1 == null ? null : the1.toJson(),
      };
}

class The1 {
  The1({
    this.subChild,
  });

  List<SubChild> subChild;

  factory The1.fromJson(Map<String, dynamic> json) => The1(
        subChild: json["SubChild"] == null
            ? null
            : List<SubChild>.from(
                json["SubChild"].map((x) => SubChild.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "SubChild": subChild == null
            ? null
            : List<dynamic>.from(subChild.map((x) => x.toJson())),
      };
}

class SubChild {
  SubChild({
    this.id,
    this.propertyChildCategoryId,
    this.propertyChildCategoryTitle,
    this.title,
    this.slug,
    this.image,
    this.status,
    this.orderBy,
  });

  String id;
  String propertyChildCategoryId;
  String propertyChildCategoryTitle;
  String title;
  String slug;
  String image;
  String status;
  dynamic orderBy;

  factory SubChild.fromJson(Map<String, dynamic> json) => SubChild(
        id: json["id"] == null ? null : json["id"],
        propertyChildCategoryId: json["property_child_category_id"] == null
            ? null
            : json["property_child_category_id"],
        propertyChildCategoryTitle:
            json["property_child_category_title"] == null
                ? null
                : json["property_child_category_title"],
        title: json["title"] == null ? null : json["title"],
        slug: json["slug"] == null ? null : json["slug"],
        image: json["image"],
        status: json["status"] == null ? null : json["status"],
        orderBy: json["order_by"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "property_child_category_id":
            propertyChildCategoryId == null ? null : propertyChildCategoryId,
        "property_child_category_title": propertyChildCategoryTitle == null
            ? null
            : propertyChildCategoryTitle,
        "title": title == null ? null : title,
        "slug": slug == null ? null : slug,
        "image": image,
        "status": status == null ? null : status,
        "order_by": orderBy,
      };
}

class Parent {
  Parent({
    this.id,
    this.title,
    this.slug,
    this.image,
    this.status,
    this.orderBy,
    this.createdByCompId,
    this.createdByUserId,
  });

  String id;
  String title;
  String slug;
  dynamic image;
  String status;
  dynamic orderBy;
  String createdByCompId;
  String createdByUserId;

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        slug: json["slug"] == null ? null : json["slug"],
        image: json["image"],
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
        "title": title == null ? null : title,
        "slug": slug == null ? null : slug,
        "image": image,
        "status": status == null ? null : status,
        "order_by": orderBy,
        "created_by_comp_id": createdByCompId == null ? null : createdByCompId,
        "created_by_user_id": createdByUserId == null ? null : createdByUserId,
      };
}

class Purpose {
  Purpose({
    this.purpose,
    this.purposeTypes,
  });

  PurposePurpose purpose;
  List<PurposeTypeElement> purposeTypes;

  factory Purpose.fromJson(Map<String, dynamic> json) => Purpose(
        purpose: json["Purpose"] == null
            ? null
            : PurposePurpose.fromJson(json["Purpose"]),
        purposeTypes: json["PurposeTypes"] == null
            ? null
            : List<PurposeTypeElement>.from(json["PurposeTypes"]
                .map((x) => PurposeTypeElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Purpose": purpose == null ? null : purpose.toJson(),
        "PurposeTypes": purposeTypes == null
            ? null
            : List<dynamic>.from(purposeTypes.map((x) => x.toJson())),
      };
}

class PurposePurpose {
  PurposePurpose({
    this.id,
    this.title,
    this.slug,
    this.image,
    this.status,
    this.orderBy,
    this.createdByCompId,
    this.createdByUserId,
  });

  String id;
  String title;
  String slug;
  dynamic image;
  String status;
  dynamic orderBy;
  String createdByCompId;
  String createdByUserId;

  factory PurposePurpose.fromJson(Map<String, dynamic> json) => PurposePurpose(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        slug: json["slug"] == null ? null : json["slug"],
        image: json["image"],
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
        "title": title == null ? null : title,
        "slug": slug == null ? null : slug,
        "image": image,
        "status": status == null ? null : status,
        "order_by": orderBy,
        "created_by_comp_id": createdByCompId == null ? null : createdByCompId,
        "created_by_user_id": createdByUserId == null ? null : createdByUserId,
      };
}

class PurposeTypeElement {
  PurposeTypeElement({
    this.purposeType,
  });

  PurposeTypePurposeType purposeType;

  factory PurposeTypeElement.fromJson(Map<String, dynamic> json) =>
      PurposeTypeElement(
        purposeType: json["PurposeType"] == null
            ? null
            : PurposeTypePurposeType.fromJson(json["PurposeType"]),
      );

  Map<String, dynamic> toJson() => {
        "PurposeType": purposeType == null ? null : purposeType.toJson(),
      };
}

class PurposeTypePurposeType {
  PurposeTypePurposeType({
    this.id,
    this.propertyPurposeId,
    this.propertyPurposeTitle,
    this.title,
    this.slug,
    this.status,
    this.orderBy,
  });

  String id;
  String propertyPurposeId;
  String propertyPurposeTitle;
  String title;
  String slug;
  String status;
  dynamic orderBy;

  factory PurposeTypePurposeType.fromJson(Map<String, dynamic> json) =>
      PurposeTypePurposeType(
        id: json["id"] == null ? null : json["id"],
        propertyPurposeId: json["property_purpose_id"] == null
            ? null
            : json["property_purpose_id"],
        propertyPurposeTitle: json["property_purpose_title"] == null
            ? null
            : json["property_purpose_title"],
        title: json["title"] == null ? null : json["title"],
        slug: json["slug"] == null ? null : json["slug"],
        status: json["status"] == null ? null : json["status"],
        orderBy: json["order_by"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "property_purpose_id":
            propertyPurposeId == null ? null : propertyPurposeId,
        "property_purpose_title":
            propertyPurposeTitle == null ? null : propertyPurposeTitle,
        "title": title == null ? null : title,
        "slug": slug == null ? null : slug,
        "status": status == null ? null : status,
        "order_by": orderBy,
      };
}

class PropertyFeatureAndNearBy {
  PropertyFeatureAndNearBy({
    this.id,
    this.propertyFeatureTypeId,
    this.propertyFeatureTypeTitle,
    this.title,
    this.image,
    this.status,
    this.orderBy,
    this.createdByCompId,
    this.createdByUserId,
    this.updatedByUserId,
    this.deletedByUserId,
    this.createdAt,
  });

  String id;
  String propertyFeatureTypeId;
  String propertyFeatureTypeTitle;
  String title;
  String image;

  String status;
  dynamic orderBy;
  String createdByCompId;
  String createdByUserId;
  dynamic updatedByUserId;
  dynamic deletedByUserId;
  DateTime createdAt;

  factory PropertyFeatureAndNearBy.fromJson(Map<String, dynamic> json) =>
      PropertyFeatureAndNearBy(
        id: json["id"] == null ? null : json["id"],
        propertyFeatureTypeId: json["property_feature_type_id"] == null
            ? null
            : json["property_feature_type_id"],
        propertyFeatureTypeTitle: json["property_feature_type_title"] == null
            ? null
            : json["property_feature_type_title"],
        title: json["title"] == null ? null : json["title"],
        image: json["image"] == null ? null : json["image"],
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
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "property_feature_type_id":
            propertyFeatureTypeId == null ? null : propertyFeatureTypeId,
        "property_feature_type_title":
            propertyFeatureTypeTitle == null ? null : propertyFeatureTypeTitle,
        "title": title == null ? null : title,
        "image": image == null ? null : image,
        "status": status == null ? null : status,
        "order_by": orderBy,
        "created_by_comp_id": createdByCompId == null ? null : createdByCompId,
        "created_by_user_id": createdByUserId == null ? null : createdByUserId,
        "updated_by_user_id": updatedByUserId,
        "deleted_by_user_id": deletedByUserId,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
      };
}

class City {
  City({
    this.id,
    this.provinceId,
    this.provinceTitle,
    this.countryId,
    this.name,
    this.latitude,
    this.longitude,
    this.status,
    this.orderBy,
    this.createdByCompId,
    this.createdByUserId,
    this.createdAt,
  });

  String id;
  String provinceId;
  String provinceTitle;
  String countryId;
  String name;
  String latitude;
  String longitude;
  String status;
  dynamic orderBy;
  String createdByCompId;
  String createdByUserId;
  DateTime createdAt;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"] == null ? null : json["id"],
        provinceId: json["province_id"] == null ? null : json["province_id"],
        provinceTitle:
            json["province_title"] == null ? null : json["province_title"],
        countryId: json["country_id"] == null ? null : json["country_id"],
        name: json["name"] == null ? null : json["name"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        status: json["status"] == null ? null : json["status"],
        orderBy: json["order_by"],
        createdByCompId: json["created_by_comp_id"] == null
            ? null
            : json["created_by_comp_id"],
        createdByUserId: json["created_by_user_id"] == null
            ? null
            : json["created_by_user_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "province_id": provinceId == null ? null : provinceId,
        "province_title": provinceTitle == null ? null : provinceTitle,
        "country_id": countryId == null ? null : countryId,
        "name": name == null ? null : name,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "status": status == null ? null : status,
        "order_by": orderBy,
        "created_by_comp_id": createdByCompId == null ? null : createdByCompId,
        "created_by_user_id": createdByUserId == null ? null : createdByUserId,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
      };
}

class Country {
  Country({
    this.id,
    this.name,
    this.slug,
    this.twoLetterCode,
    this.threeLetterCode,
    this.flag,
    this.latitude,
    this.longitude,
    this.status,
    this.orderBy,
    this.createdByCompId,
    this.createdByUserId,
    this.createdAt,
  });

  String id;
  String name;
  dynamic slug;
  String twoLetterCode;
  String threeLetterCode;
  dynamic flag;
  String latitude;
  String longitude;
  String status;
  dynamic orderBy;
  String createdByCompId;
  String createdByUserId;
  DateTime createdAt;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        slug: json["slug"],
        twoLetterCode:
            json["two_letter_code"] == null ? null : json["two_letter_code"],
        threeLetterCode: json["three_letter_code"] == null
            ? null
            : json["three_letter_code"],
        flag: json["flag"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        status: json["status"] == null ? null : json["status"],
        orderBy: json["order_by"],
        createdByCompId: json["created_by_comp_id"] == null
            ? null
            : json["created_by_comp_id"],
        createdByUserId: json["created_by_user_id"] == null
            ? null
            : json["created_by_user_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "slug": slug,
        "two_letter_code": twoLetterCode == null ? null : twoLetterCode,
        "three_letter_code": threeLetterCode == null ? null : threeLetterCode,
        "flag": flag,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "status": status == null ? null : status,
        "order_by": orderBy,
        "created_by_comp_id": createdByCompId == null ? null : createdByCompId,
        "created_by_user_id": createdByUserId == null ? null : createdByUserId,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
      };
}

class Currency {
  Currency({
    this.id,
    this.curKnowBaseId,
    this.currencyKnowledgeBaseTitle,
    this.currencyKnowledgeBaseCode,
    this.currencyKnowledgeBaseFlag,
    this.currencyKnowledgeBaseSymbol,
    this.title,
    this.exchangeType,
    this.exchangeRate,
    this.status,
    this.orderBy,
    this.createdByCompId,
    this.createdByUserId,
    this.createdAt,
  });

  String id;
  String curKnowBaseId;
  String currencyKnowledgeBaseTitle;
  String currencyKnowledgeBaseCode;
  String currencyKnowledgeBaseFlag;
  String currencyKnowledgeBaseSymbol;
  String title;
  String exchangeType;
  String exchangeRate;
  String status;
  dynamic orderBy;
  String createdByCompId;
  String createdByUserId;
  DateTime createdAt;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        id: json["id"] == null ? null : json["id"],
        curKnowBaseId:
            json["cur_know_base_id"] == null ? null : json["cur_know_base_id"],
        currencyKnowledgeBaseTitle:
            json["currency_knowledge_base_title"] == null
                ? null
                : json["currency_knowledge_base_title"],
        currencyKnowledgeBaseCode: json["currency_knowledge_base_code"] == null
            ? null
            : json["currency_knowledge_base_code"],
        currencyKnowledgeBaseFlag: json["currency_knowledge_base_flag"] == null
            ? null
            : json["currency_knowledge_base_flag"],
        currencyKnowledgeBaseSymbol:
            json["currency_knowledge_base_symbol"] == null
                ? null
                : json["currency_knowledge_base_symbol"],
        title: json["title"] == null ? null : json["title"],
        exchangeType:
            json["exchange_type"] == null ? null : json["exchange_type"],
        exchangeRate:
            json["exchange_rate"] == null ? null : json["exchange_rate"],
        status: json["status"] == null ? null : json["status"],
        orderBy: json["order_by"],
        createdByCompId: json["created_by_comp_id"] == null
            ? null
            : json["created_by_comp_id"],
        createdByUserId: json["created_by_user_id"] == null
            ? null
            : json["created_by_user_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "cur_know_base_id": curKnowBaseId == null ? null : curKnowBaseId,
        "currency_knowledge_base_title": currencyKnowledgeBaseTitle == null
            ? null
            : currencyKnowledgeBaseTitle,
        "currency_knowledge_base_code": currencyKnowledgeBaseCode == null
            ? null
            : currencyKnowledgeBaseCode,
        "currency_knowledge_base_flag": currencyKnowledgeBaseFlag == null
            ? null
            : currencyKnowledgeBaseFlag,
        "currency_knowledge_base_symbol": currencyKnowledgeBaseSymbol == null
            ? null
            : currencyKnowledgeBaseSymbol,
        "title": title == null ? null : title,
        "exchange_type": exchangeType == null ? null : exchangeType,
        "exchange_rate": exchangeRate == null ? null : exchangeRate,
        "status": status == null ? null : status,
        "order_by": orderBy,
        "created_by_comp_id": createdByCompId == null ? null : createdByCompId,
        "created_by_user_id": createdByUserId == null ? null : createdByUserId,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
      };
}

class Location {
  Location({
    this.id,
    this.areaId,
    this.areaName,
    this.cityId,
    this.name,
    this.latitude,
    this.longitude,
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
  String areaId;
  String areaName;
  String cityId;
  String name;
  String latitude;
  String longitude;
  String status;
  dynamic orderBy;
  String createdByCompId;
  String createdByUserId;
  dynamic updatedByUserId;
  dynamic deletedByUserId;
  DateTime createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"] == null ? null : json["id"],
        areaId: json["area_id"] == null ? null : json["area_id"],
        areaName: json["area_name"] == null ? null : json["area_name"],
        cityId: json["city_id"] == null ? null : json["city_id"],
        name: json["name"] == null ? null : json["name"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
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
        "area_id": areaId == null ? null : areaId,
        "area_name": areaName == null ? null : areaName,
        "city_id": cityId == null ? null : cityId,
        "name": name == null ? null : name,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
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

class Province {
  Province({
    this.id,
    this.countryId,
    this.countryName,
    this.title,
    this.slug,
    this.twoLetterCode,
    this.latitude,
    this.longitude,
    this.status,
    this.orderBy,
    this.createdByCompId,
    this.createdByUserId,
    this.updatedByUserId,
    this.deletedByUserId,
    this.createdAt,
  });

  String id;
  String countryId;
  String countryName;
  String title;
  dynamic slug;
  dynamic twoLetterCode;
  String latitude;
  String longitude;
  String status;
  dynamic orderBy;
  String createdByCompId;
  String createdByUserId;
  dynamic updatedByUserId;
  dynamic deletedByUserId;
  DateTime createdAt;

  factory Province.fromJson(Map<String, dynamic> json) => Province(
        id: json["id"] == null ? null : json["id"],
        countryId: json["country_id"] == null ? null : json["country_id"],
        countryName: json["country_name"] == null ? null : json["country_name"],
        title: json["title"] == null ? null : json["title"],
        slug: json["slug"],
        twoLetterCode: json["two_letter_code"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
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
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "country_id": countryId == null ? null : countryId,
        "country_name": countryName == null ? null : countryName,
        "title": title == null ? null : title,
        "slug": slug,
        "two_letter_code": twoLetterCode,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "status": status == null ? null : status,
        "order_by": orderBy,
        "created_by_comp_id": createdByCompId == null ? null : createdByCompId,
        "created_by_user_id": createdByUserId == null ? null : createdByUserId,
        "updated_by_user_id": updatedByUserId,
        "deleted_by_user_id": deletedByUserId,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
      };
}

class Unit {
  Unit({
    this.id,
    this.title,
    this.slug,
    this.code,
    this.status,
    this.orderBy,
    this.createdByCompId,
    this.createdByUserId,
    this.createdAt,
  });

  String id;
  String title;
  String slug;
  String code;
  String status;
  dynamic orderBy;
  String createdByCompId;
  String createdByUserId;
  DateTime createdAt;

  factory Unit.fromJson(Map<String, dynamic> json) => Unit(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        slug: json["slug"] == null ? null : json["slug"],
        code: json["code"] == null ? null : json["code"],
        status: json["status"] == null ? null : json["status"],
        orderBy: json["order_by"],
        createdByCompId: json["created_by_comp_id"] == null
            ? null
            : json["created_by_comp_id"],
        createdByUserId: json["created_by_user_id"] == null
            ? null
            : json["created_by_user_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "slug": slug == null ? null : slug,
        "code": code == null ? null : code,
        "status": status == null ? null : status,
        "order_by": orderBy,
        "created_by_comp_id": createdByCompId == null ? null : createdByCompId,
        "created_by_user_id": createdByUserId == null ? null : createdByUserId,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
      };
}

class Area {
  Area({
    this.id,
    this.cityId,
    this.cityName,
    this.provinceId,
    this.name,
    this.image,
    this.code,
    this.latitude,
    this.longitude,
    this.status,
    this.orderBy,
    this.createdByCompId,
    this.createdByUserId,
    this.createdAt,
    this.provinceTitle,
    this.countryId,
  });

  String id;
  String cityId;
  String cityName;
  String provinceId;
  String name;
  String image;
  String code;
  String latitude;
  String longitude;
  String status;
  dynamic orderBy;
  String createdByCompId;
  String createdByUserId;
  DateTime createdAt;
  String provinceTitle;
  String countryId;

  factory Area.fromJson(Map<String, dynamic> json) => Area(
        id: json["id"] == null ? null : json["id"],
        cityId: json["city_id"] == null ? null : json["city_id"],
        cityName: json["city_name"] == null ? null : json["city_name"],
        provinceId: json["province_id"] == null ? null : json["province_id"],
        name: json["name"] == null ? null : json["name"],
        image: json["image"] == null ? null : json["image"],
        code: json["code"] == null ? null : json["code"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        status: json["status"] == null ? null : json["status"],
        orderBy: json["order_by"],
        createdByCompId: json["created_by_comp_id"] == null
            ? null
            : json["created_by_comp_id"],
        createdByUserId: json["created_by_user_id"] == null
            ? null
            : json["created_by_user_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        provinceTitle:
            json["province_title"] == null ? null : json["province_title"],
        countryId: json["country_id"] == null ? null : json["country_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "city_id": cityId == null ? null : cityId,
        "city_name": cityName == null ? null : cityName,
        "province_id": provinceId == null ? null : provinceId,
        "name": name == null ? null : name,
        "image": image == null ? null : image,
        "code": code == null ? null : code,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "status": status == null ? null : status,
        "order_by": orderBy,
        "created_by_comp_id": createdByCompId == null ? null : createdByCompId,
        "created_by_user_id": createdByUserId == null ? null : createdByUserId,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "province_title": provinceTitle == null ? null : provinceTitle,
        "country_id": countryId == null ? null : countryId,
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
    this.accountStatus,
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
  String accountStatus;
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
    balanceTotal: json["balance_total"] == null ? null : json["balance_total"],
   accountStatus: json["account_status"] == null ? null : json["account_status"],
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
    "account_status": accountStatus == null ? null : accountStatus,
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

class Friends {
  Friends({
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
  List<Datm> data;
  int from;
  int lastPage;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory Friends.fromJson(Map<String, dynamic> json) => Friends(
    currentPage: json["current_page"],
    data: List<Datm>.from(json["data"].map((x) => Datm.fromJson(x))),
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

class Datm {
  Datm({
    this.id,
    this.userId,
    this.requestStatus,
    this.userFullName,
    this.userDisplayName,
    this.userImg,
    this.userTimezone,
    this.userSlug,
    this.status,
    this.createdAt,
  });

  String id;
  String userId;
  String requestStatus;
  String userFullName;
  String userDisplayName;
  String userImg;
  String userTimezone;
  String userSlug;
  String status;
  DateTime createdAt;

  factory Datm.fromJson(Map<String, dynamic> json) => Datm(
    id: json["id"],
    userId: json["user_id"],
    requestStatus: json["request_status"],
    userFullName: json["user_full_name"],
    userDisplayName: json["user_display_name"],
    userImg: json["user_img"],
    userTimezone: json["user_timezone"] == null ? null : json["user_timezone"],
    userSlug: json["user_slug"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "request_status": requestStatus,
    "user_full_name": userFullName,
    "user_display_name": userDisplayName,
    "user_img": userImg,
    "user_timezone": userTimezone == null ? null : userTimezone,
    "user_slug": userSlug,
    "status": status,
    "created_at": createdAt.toIso8601String(),
  };
}

class Developers {
  Developers({
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

  factory Developers.fromJson(Map<String, dynamic> json) => Developers(
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
