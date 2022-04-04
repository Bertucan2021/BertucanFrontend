import 'dart:convert';

List<GBVCentersData> gbvCentersDataFromJson(String str) =>
    List<GBVCentersData>.from(
        json.decode(str).map((x) => GBVCentersData.fromJson(x)));

String gbvCentersDataToJson(List<GBVCentersData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GBVCentersData {
  GBVCentersData(
      {this.id,
      this.name,
      this.description,
      this.phonenumber,
      this.long,
      this.lat,
      this.membershipid,
      this.license,
      this.createdAt,
      this.status,
      this.city});

  int? id;
  String? name;
  String? description;
  String? phonenumber;
  String? long;
  String? lat;
  int? membershipid;
  String? license;
  String? createdAt;
  String? status;
  String? city;

  factory GBVCentersData.fromJson(Map<String, dynamic> json) => GBVCentersData(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      phonenumber: json["phone_number"],
      long: json["address"]["longitude"],
      lat: json["address"]["latitude"],
      city: json["address"]["city"],
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
        "status": status
      };
}
