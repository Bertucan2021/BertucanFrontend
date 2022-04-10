import 'dart:convert';

import 'package:bertucanfrontend/Model/user_model.dart';
import 'package:http/http.dart' as http;


class UserDataProvider{
  final _baseUrl = "https://bertucan.herokuapp.com/api";
  final http.Client httpClient;

  UserDataProvider({required this.httpClient});

  Future<User> registerUser({
        required String firstName,
        required String lastName,
        required String phone,
        required String email,
      required String password}) async {
    final response = await httpClient.post(
      Uri.parse('$_baseUrl/users'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "first_name": firstName,
        "last_name":lastName,
        "email":email,
        "phone_number":phone,
        "password":password
      }),
    );
    print(response.statusCode.toString());
    print(response.body.toString());
    if (response.statusCode == 201) {
      print(jsonDecode(response.body)['data']);
      User userData = User.fromJson(jsonDecode(response.body)['data']);
      print('Wow');
      print(userData);
      return userData;
    } else if(response.statusCode == 409){
      String message = jsonDecode(response.body)['content'][0]['error'] ;
      throw Exception(message);
    }

    throw Exception('Something went wrong :) Please try again!');
  }
}