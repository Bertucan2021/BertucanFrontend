import 'dart:convert';

import 'dart:io';

List<ReportData> reportDataFromJson(String str) =>
    List<ReportData>.from(json.decode(str).map((x) => ReportData.fromJson(x)));

class ReportData {
  ReportData(
      {this.id,
      this.long,
      this.lat,
      this.city,
      this.abuseType,
      this.country,
      this.message,
      this.reportedby});

  int? id;
  String? message;
  int? reportedby;
  int? abuseType;
  String? country;
  String? lat;
  String? long;
  String? city;

  factory ReportData.fromJson(Map<String, dynamic> json) => ReportData(
        id: json["id"],
        message: json["message"],
        reportedby: json["user_id"],
        abuseType: json["abuse_types_id"],
        country: json["address"]["country"],
        long: json["address"]["longitude"],
        lat: json["address"]["latitude"],
        city: json["address"]["city"],
      );
}
