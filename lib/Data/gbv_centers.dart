import 'dart:convert';

List<GBVCentersData> gbvCentersDataFromJson(String str) =>
    List<GBVCentersData>.from(
        json.decode(str).map((x) => GBVCentersData.fromJson(x)));

String gbvCentersDataToJson(List<GBVCentersData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GBVCentersData {
  GBVCentersData({
    this.id,
    this.name,
    this.description,
    this.phonenumber,
    this.logo,
    this.membershipid,
    this.license,
    this.createdAt,
    this.status,
  });

  int? id;
  String? name;
  String? description;
  String? phonenumber;
  String? logo;
  int? membershipid;
  String? license;
  String? createdAt;
  String? status;

  factory GBVCentersData.fromJson(Map<String, dynamic> json) => GBVCentersData(
      id: json["id"],
      name: json["name"],
      logo: json["logo"],
      description: json["description"],
      phonenumber: json["phone_number"],
      membershipid: json["membership_id"],
      license: json["license"],
      createdAt: json["created_at"],
      status: json["status"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "phone_number": phonenumber,
        "membership_id": membershipid,
        "license": license,
        "created_at": createdAt,
        "status": status,
        "logo": logo
      };
}
