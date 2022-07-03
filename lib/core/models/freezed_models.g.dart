// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'freezed_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserToSignUp _$$_UserToSignUpFromJson(Map<String, dynamic> json) =>
    _$_UserToSignUp(
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      password: json['password'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$_UserToSignUpToJson(_$_UserToSignUp instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
      'name': instance.name,
    };

_$_UserToLogin _$$_UserToLoginFromJson(Map<String, dynamic> json) =>
    _$_UserToLogin(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$_UserToLoginToJson(_$_UserToLogin instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
