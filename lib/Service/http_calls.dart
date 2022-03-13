import 'dart:convert';
import 'dart:io';
import 'package:bertucanfrontend/Data/article.dart';
import 'package:bertucanfrontend/Data/gbv_centers.dart';
import 'package:bertucanfrontend/Service/shared_pref.dart';
import 'package:http/http.dart' as http;

class HttpCalls {
  //Get Requests
  final _getSRHArticles = "https://bertucan.herokuapp.com/api/articles";
  final _getSRHArticleDetail = "https://bertucan.herokuapp.com/api/articles/";
  final _getGBVCenters = "https://bertucan.herokuapp.com/api/gbvcenters";
  final _getGBVCenterDetail = "https://bertucan.herokuapp.com/api/gbvcenters/";

  // Put token in to header
  static Map<String, String> _getRequestHeader({String token = ""}) {
    if (token == "") {
      return {
        "Content-type": "application/json",
        'Charset': 'utf-8',
      };
    }
    return {
      "Content-type": "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };
  }

  Future<String?> getToken() async {
    return await SharedPref.getToken();
  }

  Future<List<ArticleData>> getSRHArticles() async {
    // ignore: avoid_print
    print("inside get");
    List<ArticleData> articles = [];
    return await http
        .get(Uri.parse(_getSRHArticles), headers: _getRequestHeader())
        .then((value) async {
      // ignore: avoid_print
      print(Uri.parse(_getSRHArticles));
      if (value.statusCode == 200) {
        var response = jsonDecode(value.body);
        var data = response["data"];

        for (var responseArticles in data) {
          articles.add(ArticleData.fromJson(responseArticles));
          // ignore: avoid_print
        }
        // ignore: avoid_print
        print(articles);

        return articles;
      }
      return articles;
    }).catchError((onError) {
      // handleOnError(onError);
      // ignore: avoid_print
      print(onError);
      return onError;
    });
  }

  Future<ArticleData> getSRHArticleDetail(int id) async {
    ArticleData articleData = ArticleData();
    return await http
        .get(Uri.parse(_getSRHArticleDetail + id.toString()),
            headers: _getRequestHeader())
        .then((value) async {
      if (value.statusCode == 200) {
        var response = jsonDecode(value.body);

        var data = response["data"];
        articleData = ArticleData.fromJson(data);

        return articleData;
      }
      return articleData;
    }).catchError((onError) {
      // handleOnError(onError);
      // ignore: avoid_print
      print(onError);
      return onError;
    });
  }

  Future<List<GBVCentersData>> getGBVCenters() async {
    // ignore: avoid_print
    print("inside get");
    List<GBVCentersData> gbvCenters = [];
    return await http
        .get(Uri.parse(_getGBVCenters), headers: _getRequestHeader())
        .then((value) async {
      // ignore: avoid_print
      print(Uri.parse(_getSRHArticles));
      if (value.statusCode == 200) {
        var response = jsonDecode(value.body);
        var data = response["data"];

        for (var responseGBVCenters in data) {
          gbvCenters.add(GBVCentersData.fromJson(responseGBVCenters));
          // ignore: avoid_print
        }
        // ignore: avoid_print
        print(gbvCenters);

        return gbvCenters;
      }
      return gbvCenters;
    }).catchError((onError) {
      // handleOnError(onError);
      // ignore: avoid_print
      print(onError);
      return onError;
    });
  }

  Future<GBVCentersData> getGBVCenterDetail(int id) async {
    GBVCentersData gbvCentersData = GBVCentersData();
    return await http
        .get(Uri.parse(_getGBVCenterDetail + id.toString()),
            headers: _getRequestHeader())
        .then((value) async {
      if (value.statusCode == 200) {
        var response = jsonDecode(value.body);

        var data = response["data"];
        gbvCentersData = GBVCentersData.fromJson(data);

        return gbvCentersData;
      }
      return gbvCentersData;
    }).catchError((onError) {
      // handleOnError(onError);
      // ignore: avoid_print
      print(onError);
      return onError;
    });
  }
}
