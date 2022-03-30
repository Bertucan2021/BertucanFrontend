import 'dart:convert';
import 'dart:io';
import 'package:bertucanfrontend/Data/abuse_type.dart';
import 'package:bertucanfrontend/Data/article.dart';
import 'package:bertucanfrontend/Data/gbv_centers.dart';
import 'package:bertucanfrontend/Data/report.dart';
import 'package:bertucanfrontend/Service/shared_pref.dart';
import 'package:http/http.dart' as http;

class HttpCalls {
  //Get Requests
  final _baseUrl = "https://bertucan.herokuapp.com/api/";
  final _getSRHArticles = "articles";
  final _getSRHArticleDetail = "articles/";
  final _getGBVCenters = "gbvcenters";
  final _getGBVCenterDetail = "gbvcenters/";
  final _postGBVReport = "reports";  
  final _getAbuseTypes = "abusetypes";

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
        .get(Uri.parse(_baseUrl + _getSRHArticles),
            headers: _getRequestHeader())
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
        .get(Uri.parse(_baseUrl + _getSRHArticleDetail + id.toString()),
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
        .get(Uri.parse(_baseUrl + _getGBVCenters), headers: _getRequestHeader())
        .then((value) async {
      // ignore: avoid_print
      print(Uri.parse(_baseUrl + _getSRHArticles));
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
        .get(Uri.parse(_baseUrl + _getGBVCenterDetail + id.toString()),
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

  Future<int> postGBVReport(ReportData reportData) async {
    // ignore: avoid_print
    print(reportData.toJson());
    return await http
        .post(Uri.parse(_baseUrl + _postGBVReport),
            headers: _getRequestHeader(), body: jsonEncode(reportData.toJson()))
        .then((value) async {
      // ignore: avoid_print
      print(value.statusCode);
      if (value.statusCode == 200) {
        return value.statusCode;

        // ignore: avoid_print

      }
      return value.statusCode;
    }).catchError((onError) {
      // ignore: avoid_print
      print(onError);
      // handleOnError(onError, masterProvider);
      return -1;
    });
  }
}

 Future<List<AbuseType>> getAbuseType() async {
    // ignore: avoid_print
    print("inside get");
    List<AbuseType> abuseTypes = [];
    return await http
        .get(Uri.parse(_baseUrl + _getAbuseTypes), headers: _getRequestHeader())
        .then((value) async {
      // ignore: avoid_print
      if (value.statusCode == 200) {
        var response = jsonDecode(value.body);
        var data = response["data"];

        for (var responseAbuseTypes in data) {
          abuseTypes.add(AbuseType.fromJson(responseAbuseTypes));
          // ignore: avoid_print
        }
        // ignore: avoid_print
        print(abuseTypes);

        return abuseTypes;
      }
      return abuseTypes;
    }).catchError((onError) {
      // handleOnError(onError);
      // ignore: avoid_print
      print(onError);
      return onError;
    });
  }
}