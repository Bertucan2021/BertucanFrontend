import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bertucanfrontend/core/enums/common_enums.dart';
import 'package:bertucanfrontend/core/services/api/dio_client.dart';
import 'package:bertucanfrontend/core/services/api/network_exceptions.dart';
import 'package:bertucanfrontend/utils/functions.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:get/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

class ApiClient {
  late DioClient dioClient;
  final Dio dio;
  final Connectivity connectivity;
  Map<String, dynamic> defaultParams = {};

  ApiClient({
    required this.dio,
    required this.connectivity,
  }) {
    dioClient = DioClient(dio, connectivity: connectivity);
  }

  Future<Map<String, dynamic>> request(
      {required RequestType requestType,
      bool requiresAuth = true,
      bool requiresDefaultParams = true,
      String? port,
      required String path,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? data}) async {
    try {
      log("request: $requestType $path");
      log("data: $data");
      log("queryParameters: $queryParameters");
      if (requiresAuth) await dioClient.addAuthorizationInterceptor();
      if (requiresDefaultParams && data != null) {
        String locale = GetStorage().read<String>('locale') ?? 'en';
        data.addAll(defaultParams);
        data['locale'] = locale;
      }

      if (requiresDefaultParams && queryParameters != null) {
        queryParameters.addAll(defaultParams);
        GetStorage storage = GetStorage();
        final accessToken = storage.read('accessToken');
        String locale = storage.read<String>('locale') ?? 'en';
        queryParameters.addAll({
          'locale': locale,
          'access_token': accessToken,
        });
      }

      //log('sent payload: $data');
      dynamic response;
      switch (requestType) {
        case RequestType.get:
          response =
              await dioClient.get(path, queryParameters: queryParameters);
          break;
        case RequestType.post:
          response = await dioClient.post(path, data: data);
          break;
        case RequestType.patch:
          response = await dioClient.patch(path, data: data);
          break;
        case RequestType.delete:
          response = await dioClient.delete(path);
          break;
        case RequestType.put:
          response = await dioClient.put(path, data: data);
          break;
        default:
          throw "Request type not found.";
      }

      log('response: $response');
      return (response is String) ? jsonDecode(response) : response;
    } on DioError catch (e) {
      final errorMessage = NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(e));
      log('Api Error: $errorMessage');
      return Future.error(NetworkExceptions.getDioException(e));
      //return NetworkExceptions.getDioException(e);
    }
  }

  Future<Map<String, dynamic>> uploadFile(
      String file, Map<String, dynamic> extra, String path) async {
    String fileName = file.split('/').last;
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file, filename: fileName),
      ...extra,
    });
    var response = await dioClient.post(path,
        data: formData,
        options: Options(headers: {"Content-Type": "multipart/form-data;"}));
    return (response is String) ? jsonDecode(response) : response;
  }

  // sends form data for single or multiple files
  Future<Map<String, dynamic>> sendFormData({
    required String fileFieldName,
    required Map<String, dynamic> formPayload,
    required String endPoint,
    String? port,
    File? file,
    List<File>? files,
  }) async {
    try {
      // For multiple files case
      if (files?.isNotEmpty ?? false) {
        List<MultipartFile> multipartFiles = [];
        for (File file in files!) {
          String? mimeType = lookupMimeType(file.path);
          List<String> splitMimeTypes = mimeType?.split('/') ?? [];

          final MultipartFile multipartFile = MultipartFile.fromFileSync(
              file.path,
              contentType: MediaType(splitMimeTypes[0], splitMimeTypes[1]));

          multipartFiles.add(multipartFile);
        }

        formPayload[fileFieldName] = multipartFiles;
      } else if (file?.path.isNotEmpty ?? false) {
        // case for single file form data
        String? mimeType = lookupMimeType(file!.path);
        List<String> splitMimeTypes = mimeType?.split('/') ?? [];

        final MultipartFile multipartFile = MultipartFile.fromFileSync(
            file.path,
            contentType: MediaType(splitMimeTypes[0], splitMimeTypes[1]));
        formPayload[fileFieldName] = multipartFile;
      }

      formPayload.addAll(defaultParams);
      final accessToken = GetStorage().read('accessToken');
      formPayload['access_token'] = accessToken;
      log('form payload here: $formPayload');
      var formData = FormData.fromMap(formPayload);

      final response = await dioClient.post(endPoint, data: formData);
      // Iterable l = json.decode(jsonEncode(response));
      // return List<Files>.from(l.map((model) => Files.fromJson(model)).toList());

      return (response is String) ? jsonDecode(response) : response;
    } on DioError catch (e) {
      final errorMessage = NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(e));
      print(errorMessage);
      toast('error', e.response?.data['message']);
      return Future.error(errorMessage);
    }
  }
}
