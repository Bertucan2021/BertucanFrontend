import 'dart:convert';

List<ArticleData> articleDataFromJson(String str) => List<ArticleData>.from(
    json.decode(str).map((x) => ArticleData.fromJson(x)));

String articleDataToJson(List<ArticleData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ArticleData {
  ArticleData(
      {this.id,
      this.title,
      this.introduction,
      this.icon,
      this.body,
      this.smallDescription,
      this.articleBy,
      this.type,
      this.createdAt,
      this.status,
      this.firstname,
      this.lastname,
      this.profilepicture});

  int? id;
  String? title;
  String? introduction;
  String? icon;
  String? body;
  String? smallDescription;
  int? articleBy;
  String? type;
  String? createdAt;
  String? status;
  String? firstname;
  String? lastname;
  String? profilepicture;

  factory ArticleData.fromJson(Map<String, dynamic> json) => ArticleData(
      id: json["id"],
      title: json["title"],
      introduction: json["introduction"],
      icon: json["icon"],
      body: json["body"],
      smallDescription: json["small_description"],
      articleBy: json["article_by"],
      type: json["type"],
      createdAt: json["created_at"],
      status: json["status"],
      firstname: json["user"]["first_name"],
      lastname: json["user"]["last_name"],
      profilepicture: json["user"]["profile_picture"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "introduction": introduction,
        "icon": icon,
        "body": body,
        "small_description": smallDescription,
        "article_by": articleBy,
        "type": type,
        "created_at": createdAt,
        "status": status
      };
}
