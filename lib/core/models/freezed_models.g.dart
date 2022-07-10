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

_$_Gbv _$$_GbvFromJson(Map<String, dynamic> json) => _$_Gbv(
      id: json['id'] as int,
      name: json['name'] as String?,
      description: json['description'] as String?,
      phone_number: json['phone_number'] as String?,
      address_id: json['address_id'] as int?,
      membership_id: json['membership_id'] as int?,
      status: json['status'] as String?,
      license: json['license'] as String?,
      logo: json['logo'] as String?,
      address: json['address'] == null
          ? null
          : GbvAddress.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_GbvToJson(_$_Gbv instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'phone_number': instance.phone_number,
      'address_id': instance.address_id,
      'membership_id': instance.membership_id,
      'status': instance.status,
      'license': instance.license,
      'logo': instance.logo,
      'address': instance.address,
    };

_$_GbvAddress _$$_GbvAddressFromJson(Map<String, dynamic> json) =>
    _$_GbvAddress(
      id: json['id'] as int?,
      country: json['country'] as String?,
      city: json['city'] as String?,
      latitude: _stringOrNullToDoubleConverter(json['latitude']),
      longitude: _stringOrNullToDoubleConverter(json['longitude']),
      type: json['type'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$_GbvAddressToJson(_$_GbvAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'country': instance.country,
      'city': instance.city,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'type': instance.type,
      'status': instance.status,
    };

_$_GbvReport _$$_GbvReportFromJson(Map<String, dynamic> json) => _$_GbvReport(
      message: json['message'] as String?,
      user_id: json['user_id'] as String?,
      abuse_types_id: json['abuse_types_id'] as String?,
      file: json['file'] as String?,
    );

Map<String, dynamic> _$$_GbvReportToJson(_$_GbvReport instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user_id': instance.user_id,
      'abuse_types_id': instance.abuse_types_id,
      'file': instance.file,
    };
