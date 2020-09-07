class Login {
  Login({
    this.data,
    this.accessToken,
    this.status,
    this.message,
  });
  Data data;
  String accessToken;
  bool status;
  String message;
  factory Login.fromJson(Map<String, dynamic> json) => Login(
    data: Data.fromJson(json["data"]),
    accessToken: json["access_token"],
    status: json["status"],
    message: json["message"],
  );
  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "access_token": accessToken,
    "status": status,
    "message": message,
  };
}
class Data {
  Data({
    this.userId,
    this.name,
    this.email,
    this.roleId,
    this.pass,
    this.mob,
    this.city,
    this.country,
    this.address,
    this.firebaseToken,
    this.img,
    this.cardNo,
    this.createdDate,
    this.isActive,
    this.isloginFromMob,
  });
  int userId;
  String name;
  String email;
  int roleId;
  dynamic pass;
  String mob;
  dynamic city;
  dynamic country;
  dynamic address;
  dynamic firebaseToken;
  dynamic img;
  dynamic cardNo;
  DateTime createdDate;
  bool isActive;
  bool isloginFromMob;
  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userId: json["user_id"],
    name: json["name"],
    email: json["email"],
    roleId: json["role_id"],
    pass: json["pass"],
    mob: json["mob"],
    city: json["city"],
    country: json["country"],
    address: json["address"],
    firebaseToken: json["firebase_token"],
    img: json["img"],
    cardNo: json["card_no"],
    createdDate: DateTime.parse(json["created_date"]),
    isActive: json["is_active"],
    isloginFromMob: json["islogin_from_mob"],
  );
  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "name": name,
    "email": email,
    "role_id": roleId,
    "pass": pass,
    "mob": mob,
    "city": city,
    "country": country,
    "address": address,
    "firebase_token": firebaseToken,
    "img": img,
    "card_no": cardNo,
    "created_date": createdDate.toIso8601String(),
    "is_active": isActive,
    "islogin_from_mob": isloginFromMob,
  };
}