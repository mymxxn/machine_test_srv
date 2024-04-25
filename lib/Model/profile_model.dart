import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  int? code;
  bool? success;
  String? status;
  List<DataModel>? data;
  User? user;

  ProfileModel({
    this.code,
    this.success,
    this.status,
    this.data,
    this.user,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        code: json["code"],
        success: json["success"],
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<DataModel>.from(json["data"]!.map((x) => DataModel.fromJson(x))),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "success": success,
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "user": user?.toJson(),
      };
}

class DataModel {
  String? id;
  int? order;
  String? englishName;
  String? malayalamName;
  int? status;
  List<SubMenu>? subMenu;

  DataModel({
    this.id,
    this.order,
    this.englishName,
    this.malayalamName,
    this.status,
    this.subMenu,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        id: json["_id"],
        order: json["order"],
        englishName: json["english_name"],
        malayalamName: json["malayalam_name"],
        status: json["status"],
        subMenu: json["sub_menu"] == null
            ? []
            : List<SubMenu>.from(
                json["sub_menu"]!.map((x) => SubMenu.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "order": order,
        "english_name": englishName,
        "malayalam_name": malayalamName,
        "status": status,
        "sub_menu": subMenu == null
            ? []
            : List<dynamic>.from(subMenu!.map((x) => x.toJson())),
      };
}

class SubMenu {
  String? id;
  int? status;
  String? mainId;
  String? englishName;
  String? malayalamName;
  String? icon;
  int? order;

  SubMenu({
    this.id,
    this.status,
    this.mainId,
    this.englishName,
    this.malayalamName,
    this.icon,
    this.order,
  });

  factory SubMenu.fromJson(Map<String, dynamic> json) => SubMenu(
        id: json["_id"],
        status: json["status"],
        mainId: json["main_id"],
        englishName: json["english_name"],
        malayalamName: json["malayalam_name"],
        icon: json["icon"],
        order: json["order"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "status": status,
        "main_id": mainId,
        "english_name": englishName,
        "malayalam_name": malayalamName,
        "icon": icon,
        "order": order,
      };
}

class User {
  String? firstName;
  String? lastName;

  User({
    this.firstName,
    this.lastName,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["firstName"],
        lastName: json["lastName"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
      };
}
