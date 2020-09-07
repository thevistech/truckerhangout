
import 'dart:convert';

Forgetpassword forgetpasswordFromJson(String str) => Forgetpassword.fromJson(json.decode(str));
String forgetpasswordToJson(Forgetpassword data) => json.encode(data.toJson());


class Forgetpassword {
  Forgetpassword({
    this.error,
    this.code,
    this.message,
   // this.data,
  });

  String error;
  String code;
  String message;
  //Data data;

  factory Forgetpassword.fromJson(Map<String, dynamic> json) => Forgetpassword(
    error: json["error"],
    code: json["code"],
    message: json["message"],
   // data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "code": code,
    "message": message,
   // "data": data.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.email,
    this.primaryEmailStatus,
    this.primaryNumber,
    this.primaryNumberStatus,
  });

  String id;
  String email;
  String primaryEmailStatus;
  String primaryNumber;
  String primaryNumberStatus;

  factory Data.fromJson(Map<String, dynamic> json) =>
      Data(
        id: json["id"],
        email: json["email"],
        primaryEmailStatus: json["primary_email_status"],
        primaryNumber: json["primary_number"],
        primaryNumberStatus: json["primary_number_status"],
      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "email": email,
        "primary_email_status": primaryEmailStatus,
        "primary_number": primaryNumber,
        "primary_number_status": primaryNumberStatus,
      };

}
