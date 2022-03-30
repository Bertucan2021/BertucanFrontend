import 'dart:convert';

List<AbuseType> abuseTypeDataFromJson(String str) =>
    List<AbuseType>.from(json.decode(str).map((x) => AbuseType.fromJson(x)));

class AbuseType {
  AbuseType({
    this.id,
    this.status,
    this.type,
  });

  int? id;
  String? status;
  String? type;

  factory AbuseType.fromJson(Map<String, dynamic> json) => AbuseType(
        id: json["id"],
        status: json["status"],
        type: json["type"],
      );
}
