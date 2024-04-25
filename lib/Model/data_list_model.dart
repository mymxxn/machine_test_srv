// To parse this JSON data, do
//
//     final dataListModel = dataListModelFromJson(jsonString);

import 'dart:convert';

DataListModel dataListModelFromJson(String str) =>
    DataListModel.fromJson(json.decode(str));

String dataListModelToJson(DataListModel data) => json.encode(data.toJson());

class DataListModel {
  int? code;
  bool? success;
  String? status;
  String? message;
  List<Datum>? data;

  DataListModel({
    this.code,
    this.success,
    this.status,
    this.message,
    this.data,
  });

  factory DataListModel.fromJson(Map<String, dynamic> json) => DataListModel(
        code: json["code"],
        success: json["success"],
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "success": success,
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  String? id;
  String? name;
  Branch? course;
  DateTime? startDate;
  DateTime? endDate;
  Branch? branch;
  String? uniqueId;

  Datum({
    this.id,
    this.name,
    this.course,
    this.startDate,
    this.endDate,
    this.branch,
    this.uniqueId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        name: json["name"],
        course: json["course"] == null ? null : Branch.fromJson(json["course"]),
        startDate: json["startDate"] == null
            ? null
            : DateTime.parse(json["startDate"]),
        endDate:
            json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        branch: json["branch"] == null ? null : Branch.fromJson(json["branch"]),
        uniqueId: json["uniqueId"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "course": course?.toJson(),
        "startDate":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "endDate":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "branch": branch?.toJson(),
        "uniqueId": uniqueId,
      };
}

class Branch {
  String? id;
  String? name;

  Branch({
    this.id,
    this.name,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        id: json["_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
      };
}
