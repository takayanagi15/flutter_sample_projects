// To parse this JSON data, do
//
//     final menuRespons = menuResponsFromJson(jsonString);
import 'dart:convert';

MenuRespons? menuResponsFromJson(String str) =>
    MenuRespons.fromJson(json.decode(str));

String menuResponsToJson(MenuRespons? data) => json.encode(data!.toJson());

class MenuRespons {
  MenuRespons({
    this.errorCode,
    this.errorMessage,
    this.token,
    this.userInfo,
    this.menuList,
  });

  int? errorCode;
  String? errorMessage;
  String? token;
  UserInfo? userInfo;
  List<MenuList?>? menuList;

  factory MenuRespons.fromJson(Map<String, dynamic> json) => MenuRespons(
        errorCode: json["ErrorCode"],
        errorMessage: json["ErrorMessage"],
        token: json["token"],
        userInfo: UserInfo.fromJson(json["UserInfo"]),
        menuList: json["menuList"] == null
            ? []
            : List<MenuList?>.from(
                json["menuList"]!.map((x) => MenuList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ErrorCode": errorCode,
        "ErrorMessage": errorMessage,
        "token": token,
        "UserInfo": userInfo!.toJson(),
        "menuList": menuList == null
            ? []
            : List<dynamic>.from(menuList!.map((x) => x!.toJson())),
      };
}

class MenuList {
  MenuList({
    this.rowId,
    this.srcId,
    this.title,
    this.subTitle,
    this.menuAuth,
    this.icon,
  });

  int? rowId;
  String? srcId;
  String? title;
  String? subTitle;
  int? menuAuth;
  String? icon;

  factory MenuList.fromJson(Map<String, dynamic> json) => MenuList(
        rowId: json["rowId"],
        srcId: json["srcId"],
        title: json["title"],
        subTitle: json["subTitle"],
        menuAuth: json["menuAuth"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "rowId": rowId,
        "srcId": srcId,
        "title": title,
        "subTitle": subTitle,
        "menuAuth": menuAuth,
        "icon": icon,
      };
}

class UserInfo {
  UserInfo({
    this.userId,
    this.name,
    this.companyId,
    this.companyName,
    this.userAuth,
    this.companyAuth,
  });

  String? userId;
  String? name;
  String? companyId;
  String? companyName;
  int? userAuth;
  int? companyAuth;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        userId: json["userId"],
        name: json["name"],
        companyId: json["companyId"],
        companyName: json["companyName"],
        userAuth: json["userAuth"],
        companyAuth: json["companyAuth"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "name": name,
        "companyId": companyId,
        "companyName": companyName,
        "userAuth": userAuth,
        "companyAuth": companyAuth,
      };
}
