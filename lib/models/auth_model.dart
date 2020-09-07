// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
    AuthModel({
        this.error,
        this.code,
        this.messages,
        this.data,
    });

    String error;
    int code;
    List<String> messages;
    Data data;

    factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        error: json["error"] == null ? null : json["error"],
        code: json["code"] == null ? null : json["code"],
        messages: json["messages"] == null ? null : List<String>.from(json["messages"].map((x) => x)),
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "error": error == null ? null : error,
        "code": code == null ? null : code,
        "messages": messages == null ? null : List<dynamic>.from(messages.map((x) => x)),
        "data": data == null ? null : data.toJson(),
    };
}

class Data {
    Data({
        this.token,
        this.url,
        this.user,
        this.code,
    });

    Token token;
    String url;
    User user;
    int code;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"] == null ? null : Token.fromJson(json["token"]),
        url: json["url"] == null ? null : json["url"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        code: json["code"] == null ? null : json["code"],
    );

    Map<String, dynamic> toJson() => {
        "token": token == null ? null : token.toJson(),
        "url": url == null ? null : url,
        "user": user == null ? null : user.toJson(),
        "code": code == null ? null : code,
    };
}

class Token {
    Token({
        this.tokenType,
        this.expiresIn,
        this.accessToken,
        this.refreshToken,
    });

    String tokenType;
    int expiresIn;
    String accessToken;
    String refreshToken;

    factory Token.fromJson(Map<String, dynamic> json) => Token(
        tokenType: json["token_type"] == null ? null : json["token_type"],
        expiresIn: json["expires_in"] == null ? null : json["expires_in"],
        accessToken: json["access_token"] == null ? null : json["access_token"],
        refreshToken: json["refresh_token"] == null ? null : json["refresh_token"],
    );

    Map<String, dynamic> toJson() => {
        "token_type": tokenType == null ? null : tokenType,
        "expires_in": expiresIn == null ? null : expiresIn,
        "access_token": accessToken == null ? null : accessToken,
        "refresh_token": refreshToken == null ? null : refreshToken,
    };
}

class User {
    User({
        this.userId,
        this.compId,
        this.userLevelId,
        this.userRulGpNamId,
        this.userFullName,
        this.displayName,
        this.gender,
        this.dateOfBirth,
        this.cnicNo,
        this.username,
        this.img,
        this.signatureImage,
        this.slug,
        this.email,
        this.userPrimaryEmailStatus,
        this.userPrimaryNumberStatus,
        this.rememberToken,
        this.points,
        this.about,
        this.validFrom,
        this.validTill,
        this.openingBalance,
        this.closingBalance,
        this.balanceTotal,
        this.userStatus,
        this.userLevelValue,
        this.userLevelType,
        this.userLevelStatus,
        this.compRulGpNamId,
        this.compName,
        this.compVerificationStatus,
        this.compValidFrom,
        this.compValidTill,
        this.compStatus,
        this.systemUserTypes,
        this.userTypeDataForLoginUser,
        this.allUsersAndThereLevels,
        this.allUsersRulesItemsData,
    });

    String userId;
    String compId;
    String userLevelId;
    String userRulGpNamId;
    String userFullName;
    String displayName;
    String gender;
    DateTime dateOfBirth;
    String cnicNo;
    String username;
    String img;
    dynamic signatureImage;
    String slug;
    String email;
    String userPrimaryEmailStatus;
    String userPrimaryNumberStatus;
    dynamic rememberToken;
    String points;
    dynamic about;
    dynamic validFrom;
    dynamic validTill;
    String openingBalance;
    String closingBalance;
    String balanceTotal;
    String userStatus;
    String userLevelValue;
    String userLevelType;
    CompStatus userLevelStatus;
    String compRulGpNamId;
    String compName;
    String compVerificationStatus;
    DateTime compValidFrom;
    DateTime compValidTill;
    CompStatus compStatus;
    SystemUserTypes systemUserTypes;
    List<UserTypeDataForLoginUser> userTypeDataForLoginUser;
    List<AllUsersAndThereLevel> allUsersAndThereLevels;
    List<AllUsersRulesItemsDatum> allUsersRulesItemsData;

    factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"] == null ? null : json["user_id"],
        compId: json["comp_id"] == null ? null : json["comp_id"],
        userLevelId: json["user_level_id"] == null ? null : json["user_level_id"],
        userRulGpNamId: json["user_rul_gp_nam_id"] == null ? null : json["user_rul_gp_nam_id"],
        userFullName: json["user_full_name"] == null ? null : json["user_full_name"],
        displayName: json["display_name"] == null ? null : json["display_name"],
        gender: json["gender"] == null ? null : json["gender"],
        dateOfBirth: json["date_of_birth"] == null ? null : DateTime.parse(json["date_of_birth"]),
        cnicNo: json["cnic_no"] == null ? null : json["cnic_no"],
        username: json["username"] == null ? null : json["username"],
        img: json["img"] == null ? null : json["img"],
        signatureImage: json["signature_image"],
        slug: json["slug"] == null ? null : json["slug"],
        email: json["email"] == null ? null : json["email"],
        userPrimaryEmailStatus: json["user_primary_email_status"] == null ? null : json["user_primary_email_status"],
        userPrimaryNumberStatus: json["user_primary_number_status"] == null ? null : json["user_primary_number_status"],
        rememberToken: json["remember_token"],
        points: json["points"] == null ? null : json["points"],
        about: json["about"],
        validFrom: json["valid_from"],
        validTill: json["valid_till"],
        openingBalance: json["opening_balance"] == null ? null : json["opening_balance"],
        closingBalance: json["closing_balance"] == null ? null : json["closing_balance"],
        balanceTotal: json["balance_total"] == null ? null : json["balance_total"],
        userStatus: json["user_status"] == null ? null : json["user_status"],
        userLevelValue: json["user_level_value"] == null ? null : json["user_level_value"],
        userLevelType: json["user_level_type"] == null ? null : json["user_level_type"],
        userLevelStatus: json["user_level_status"] == null ? null : compStatusValues.map[json["user_level_status"]],
        compRulGpNamId: json["comp_rul_gp_nam_id"] == null ? null : json["comp_rul_gp_nam_id"],
        compName: json["comp_name"] == null ? null : json["comp_name"],
        compVerificationStatus: json["comp_verification_status"] == null ? null : json["comp_verification_status"],
        compValidFrom: json["comp_valid_from"] == null ? null : DateTime.parse(json["comp_valid_from"]),
        compValidTill: json["comp_valid_till"] == null ? null : DateTime.parse(json["comp_valid_till"]),
        compStatus: json["comp_status"] == null ? null : compStatusValues.map[json["comp_status"]],
        systemUserTypes: json["SystemUserTypes"] == null ? null : SystemUserTypes.fromJson(json["SystemUserTypes"]),
        userTypeDataForLoginUser: json["UserTypeDataForLoginUser"] == null ? null : List<UserTypeDataForLoginUser>.from(json["UserTypeDataForLoginUser"].map((x) => UserTypeDataForLoginUser.fromJson(x))),
        allUsersAndThereLevels: json["AllUsersAndThereLevels"] == null ? null : List<AllUsersAndThereLevel>.from(json["AllUsersAndThereLevels"].map((x) => AllUsersAndThereLevel.fromJson(x))),
        allUsersRulesItemsData: json["AllUsersRulesItemsData"] == null ? null : List<AllUsersRulesItemsDatum>.from(json["AllUsersRulesItemsData"].map((x) => AllUsersRulesItemsDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId == null ? null : userId,
        "comp_id": compId == null ? null : compId,
        "user_level_id": userLevelId == null ? null : userLevelId,
        "user_rul_gp_nam_id": userRulGpNamId == null ? null : userRulGpNamId,
        "user_full_name": userFullName == null ? null : userFullName,
        "display_name": displayName == null ? null : displayName,
        "gender": gender == null ? null : gender,
        "date_of_birth": dateOfBirth == null ? null : "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "cnic_no": cnicNo == null ? null : cnicNo,
        "username": username == null ? null : username,
        "img": img == null ? null : img,
        "signature_image": signatureImage,
        "slug": slug == null ? null : slug,
        "email": email == null ? null : email,
        "user_primary_email_status": userPrimaryEmailStatus == null ? null : userPrimaryEmailStatus,
        "user_primary_number_status": userPrimaryNumberStatus == null ? null : userPrimaryNumberStatus,
        "remember_token": rememberToken,
        "points": points == null ? null : points,
        "about": about,
        "valid_from": validFrom,
        "valid_till": validTill,
        "opening_balance": openingBalance == null ? null : openingBalance,
        "closing_balance": closingBalance == null ? null : closingBalance,
        "balance_total": balanceTotal == null ? null : balanceTotal,
        "user_status": userStatus == null ? null : userStatus,
        "user_level_value": userLevelValue == null ? null : userLevelValue,
        "user_level_type": userLevelType == null ? null : userLevelType,
        "user_level_status": userLevelStatus == null ? null : compStatusValues.reverse[userLevelStatus],
        "comp_rul_gp_nam_id": compRulGpNamId == null ? null : compRulGpNamId,
        "comp_name": compName == null ? null : compName,
        "comp_verification_status": compVerificationStatus == null ? null : compVerificationStatus,
        "comp_valid_from": compValidFrom == null ? null : compValidFrom.toIso8601String(),
        "comp_valid_till": compValidTill == null ? null : compValidTill.toIso8601String(),
        "comp_status": compStatus == null ? null : compStatusValues.reverse[compStatus],
        "SystemUserTypes": systemUserTypes == null ? null : systemUserTypes.toJson(),
        "UserTypeDataForLoginUser": userTypeDataForLoginUser == null ? null : List<dynamic>.from(userTypeDataForLoginUser.map((x) => x.toJson())),
        "AllUsersAndThereLevels": allUsersAndThereLevels == null ? null : List<dynamic>.from(allUsersAndThereLevels.map((x) => x.toJson())),
        "AllUsersRulesItemsData": allUsersRulesItemsData == null ? null : List<dynamic>.from(allUsersRulesItemsData.map((x) => x.toJson())),
    };
}

class AllUsersAndThereLevel {
    AllUsersAndThereLevel({
        this.userId,
        this.userFullName,
        this.userLevelValue,
        this.userLevelType,
    });

    String userId;
    String userFullName;
    String userLevelValue;
    String userLevelType;

    factory AllUsersAndThereLevel.fromJson(Map<String, dynamic> json) => AllUsersAndThereLevel(
        userId: json["user_id"] == null ? null : json["user_id"],
        userFullName: json["user_full_name"] == null ? null : json["user_full_name"],
        userLevelValue: json["user_level_value"] == null ? null : json["user_level_value"],
        userLevelType: json["user_level_type"] == null ? null : json["user_level_type"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId == null ? null : userId,
        "user_full_name": userFullName == null ? null : userFullName,
        "user_level_value": userLevelValue == null ? null : userLevelValue,
        "user_level_type": userLevelType == null ? null : userLevelType,
    };
}

class AllUsersRulesItemsDatum {
    AllUsersRulesItemsDatum({
        this.userRulGpItemId,
        this.userRulGpItemTitle,
        this.userRulGpItemCreatePermission,
        this.userRulGpItemViewPermission,
        this.userRulGpItemEditPermission,
        this.userRulGpItemDeletePermission,
        this.userRulGpItemAnalyticsPermission,
        this.userRulGpItemSingleViewPermission,
        this.userRulGpItemSearchPermission,
        this.userRulGpItemExportPermission,
        this.userRulGpItemImportPermission,
        this.userRulGpItemDiscretion,
        this.userRulGpItemUrl,
        this.userRulGpItemStatus,
        this.userRulGpItemOrderBy,
        this.userRulGpItemParentId,
        this.userRulGpItemIcon,
    });

    String userRulGpItemId;
    String userRulGpItemTitle;
    CompStatus userRulGpItemCreatePermission;
    CompStatus userRulGpItemViewPermission;
    CompStatus userRulGpItemEditPermission;
    CompStatus userRulGpItemDeletePermission;
    CompStatus userRulGpItemAnalyticsPermission;
    CompStatus userRulGpItemSingleViewPermission;
    CompStatus userRulGpItemSearchPermission;
    CompStatus userRulGpItemExportPermission;
    CompStatus userRulGpItemImportPermission;
    String userRulGpItemDiscretion;
    String userRulGpItemUrl;
    CompStatus userRulGpItemStatus;
    dynamic userRulGpItemOrderBy;
    dynamic userRulGpItemParentId;
    dynamic userRulGpItemIcon;

    factory AllUsersRulesItemsDatum.fromJson(Map<String, dynamic> json) => AllUsersRulesItemsDatum(
        userRulGpItemId: json["user_rul_gp_item_id"] == null ? null : json["user_rul_gp_item_id"],
        userRulGpItemTitle: json["user_rul_gp_item_title"] == null ? null : json["user_rul_gp_item_title"],
        userRulGpItemCreatePermission: json["user_rul_gp_item_create_permission"] == null ? null : compStatusValues.map[json["user_rul_gp_item_create_permission"]],
        userRulGpItemViewPermission: json["user_rul_gp_item_view_permission"] == null ? null : compStatusValues.map[json["user_rul_gp_item_view_permission"]],
        userRulGpItemEditPermission: json["user_rul_gp_item_edit_permission"] == null ? null : compStatusValues.map[json["user_rul_gp_item_edit_permission"]],
        userRulGpItemDeletePermission: json["user_rul_gp_item_delete_permission"] == null ? null : compStatusValues.map[json["user_rul_gp_item_delete_permission"]],
        userRulGpItemAnalyticsPermission: json["user_rul_gp_item_analytics_permission"] == null ? null : compStatusValues.map[json["user_rul_gp_item_analytics_permission"]],
        userRulGpItemSingleViewPermission: json["user_rul_gp_item_single_view_permission"] == null ? null : compStatusValues.map[json["user_rul_gp_item_single_view_permission"]],
        userRulGpItemSearchPermission: json["user_rul_gp_item_search_permission"] == null ? null : compStatusValues.map[json["user_rul_gp_item_search_permission"]],
        userRulGpItemExportPermission: json["user_rul_gp_item_export_permission"] == null ? null : compStatusValues.map[json["user_rul_gp_item_export_permission"]],
        userRulGpItemImportPermission: json["user_rul_gp_item_import_permission"] == null ? null : compStatusValues.map[json["user_rul_gp_item_import_permission"]],
        userRulGpItemDiscretion: json["user_rul_gp_item_discretion"] == null ? null : json["user_rul_gp_item_discretion"],
        userRulGpItemUrl: json["user_rul_gp_item_url"] == null ? null : json["user_rul_gp_item_url"],
        userRulGpItemStatus: json["user_rul_gp_item_status"] == null ? null : compStatusValues.map[json["user_rul_gp_item_status"]],
        userRulGpItemOrderBy: json["user_rul_gp_item_order_by"],
        userRulGpItemParentId: json["user_rul_gp_item_parent_id"],
        userRulGpItemIcon: json["user_rul_gp_item_icon"],
    );

    Map<String, dynamic> toJson() => {
        "user_rul_gp_item_id": userRulGpItemId == null ? null : userRulGpItemId,
        "user_rul_gp_item_title": userRulGpItemTitle == null ? null : userRulGpItemTitle,
        "user_rul_gp_item_create_permission": userRulGpItemCreatePermission == null ? null : compStatusValues.reverse[userRulGpItemCreatePermission],
        "user_rul_gp_item_view_permission": userRulGpItemViewPermission == null ? null : compStatusValues.reverse[userRulGpItemViewPermission],
        "user_rul_gp_item_edit_permission": userRulGpItemEditPermission == null ? null : compStatusValues.reverse[userRulGpItemEditPermission],
        "user_rul_gp_item_delete_permission": userRulGpItemDeletePermission == null ? null : compStatusValues.reverse[userRulGpItemDeletePermission],
        "user_rul_gp_item_analytics_permission": userRulGpItemAnalyticsPermission == null ? null : compStatusValues.reverse[userRulGpItemAnalyticsPermission],
        "user_rul_gp_item_single_view_permission": userRulGpItemSingleViewPermission == null ? null : compStatusValues.reverse[userRulGpItemSingleViewPermission],
        "user_rul_gp_item_search_permission": userRulGpItemSearchPermission == null ? null : compStatusValues.reverse[userRulGpItemSearchPermission],
        "user_rul_gp_item_export_permission": userRulGpItemExportPermission == null ? null : compStatusValues.reverse[userRulGpItemExportPermission],
        "user_rul_gp_item_import_permission": userRulGpItemImportPermission == null ? null : compStatusValues.reverse[userRulGpItemImportPermission],
        "user_rul_gp_item_discretion": userRulGpItemDiscretion == null ? null : userRulGpItemDiscretion,
        "user_rul_gp_item_url": userRulGpItemUrl == null ? null : userRulGpItemUrl,
        "user_rul_gp_item_status": userRulGpItemStatus == null ? null : compStatusValues.reverse[userRulGpItemStatus],
        "user_rul_gp_item_order_by": userRulGpItemOrderBy,
        "user_rul_gp_item_parent_id": userRulGpItemParentId,
        "user_rul_gp_item_icon": userRulGpItemIcon,
    };
}

enum CompStatus { ACTIVE, INACTIVE }

final compStatusValues = EnumValues({
    "Active": CompStatus.ACTIVE,
    "Inactive": CompStatus.INACTIVE
});

class SystemUserTypes {
    SystemUserTypes({
        this.id,
        this.companyId,
        this.userId,
        this.systemUserTypeId,
        this.userAndSystemUserTypeRelationStatus,
        this.createdByCompId,
        this.createdByUserId,
        this.createdAt,
        this.systemUserTypeTitle,
        this.systemUserTypeStatus,
    });

    String id;
    String companyId;
    String userId;
    String systemUserTypeId;
    CompStatus userAndSystemUserTypeRelationStatus;
    String createdByCompId;
    String createdByUserId;
    DateTime createdAt;
    String systemUserTypeTitle;
    CompStatus systemUserTypeStatus;

    factory SystemUserTypes.fromJson(Map<String, dynamic> json) => SystemUserTypes(
        id: json["id"] == null ? null : json["id"],
        companyId: json["company_id"] == null ? null : json["company_id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        systemUserTypeId: json["system_user_type_id"] == null ? null : json["system_user_type_id"],
        userAndSystemUserTypeRelationStatus: json["user_and_system_user_type_relation_status"] == null ? null : compStatusValues.map[json["user_and_system_user_type_relation_status"]],
        createdByCompId: json["created_by_comp_id"] == null ? null : json["created_by_comp_id"],
        createdByUserId: json["created_by_user_id"] == null ? null : json["created_by_user_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        systemUserTypeTitle: json["system_user_type_title"] == null ? null : json["system_user_type_title"],
        systemUserTypeStatus: json["system_user_type_status"] == null ? null : compStatusValues.map[json["system_user_type_status"]],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "company_id": companyId == null ? null : companyId,
        "user_id": userId == null ? null : userId,
        "system_user_type_id": systemUserTypeId == null ? null : systemUserTypeId,
        "user_and_system_user_type_relation_status": userAndSystemUserTypeRelationStatus == null ? null : compStatusValues.reverse[userAndSystemUserTypeRelationStatus],
        "created_by_comp_id": createdByCompId == null ? null : createdByCompId,
        "created_by_user_id": createdByUserId == null ? null : createdByUserId,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "system_user_type_title": systemUserTypeTitle == null ? null : systemUserTypeTitle,
        "system_user_type_status": systemUserTypeStatus == null ? null : compStatusValues.reverse[systemUserTypeStatus],
    };
}

class UserTypeDataForLoginUser {
    UserTypeDataForLoginUser({
        this.id,
        this.userTypeId,
        this.userId,
        this.createdByCompId,
        this.createdByUserId,
        this.createdAt,
        this.userTypeTitle,
        this.userTypeStatus,
    });

    String id;
    String userTypeId;
    String userId;
    String createdByCompId;
    String createdByUserId;
    DateTime createdAt;
    String userTypeTitle;
    CompStatus userTypeStatus;

    factory UserTypeDataForLoginUser.fromJson(Map<String, dynamic> json) => UserTypeDataForLoginUser(
        id: json["id"] == null ? null : json["id"],
        userTypeId: json["user_type_id"] == null ? null : json["user_type_id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        createdByCompId: json["created_by_comp_id"] == null ? null : json["created_by_comp_id"],
        createdByUserId: json["created_by_user_id"] == null ? null : json["created_by_user_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        userTypeTitle: json["user_type_title"] == null ? null : json["user_type_title"],
        userTypeStatus: json["user_type_status"] == null ? null : compStatusValues.map[json["user_type_status"]],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "user_type_id": userTypeId == null ? null : userTypeId,
        "user_id": userId == null ? null : userId,
        "created_by_comp_id": createdByCompId == null ? null : createdByCompId,
        "created_by_user_id": createdByUserId == null ? null : createdByUserId,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "user_type_title": userTypeTitle == null ? null : userTypeTitle,
        "user_type_status": userTypeStatus == null ? null : compStatusValues.reverse[userTypeStatus],
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
