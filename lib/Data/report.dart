import 'dart:convert';

List<ReportData> reportDataFromJson(String str) =>
    List<ReportData>.from(json.decode(str).map((x) => ReportData.fromJson(x)));

String reportDataToJson(List<ReportData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
// String addressToJson(List<ReportData> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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
  String? abuseType;
  String? country;
  String? lat;
  String? long;
  String? city;

  factory ReportData.fromJson(Map<String, dynamic> json) => ReportData(
        id: json["id"],
        message: json["message"],
        reportedby: json["user_id"],
        abuseType: json["abuse_type"],
        country: json["address"]["country"],
        long: json["address"]["longitude"],
        lat: json["address"]["latitude"],
        city: json["address"]["city"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "user_id": 1,
        "abuse_type": abuseType,
        "address": {
          "country": "Ethiopia",
          "longitude": "9786",
          "latitude": "545",
          "city": "AA"
        }
      };
}
