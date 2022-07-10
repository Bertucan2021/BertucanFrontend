import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_models.g.dart';

part 'freezed_models.freezed.dart';

@freezed
class UserToSignUp with _$UserToSignUp {
  const factory UserToSignUp({
    required String email,
    required String phoneNumber,
    required String password,
    required String name,
  }) = _UserToSignUp;

  factory UserToSignUp.fromJson(Map<String, dynamic> json) =>
      _$UserToSignUpFromJson(json);
}

@freezed
class UserToLogin with _$UserToLogin {
  const factory UserToLogin({
    required String email,
    required String password,
  }) = _UserToLogin;

  factory UserToLogin.fromJson(Map<String, dynamic> json) =>
      _$UserToLoginFromJson(json);
}

@freezed
class Gbv with _$Gbv {
  const factory Gbv({
    required int id,
    String? name,
    String? description,
    String? phone_number,
    int? address_id,
    int? membership_id,
    String? status,
    String? license,
    String? logo,
    GbvAddress? address,
  }) = _Gbv;

  factory Gbv.fromJson(Map<String, dynamic> json) => _$GbvFromJson(json);
}

@freezed
class GbvAddress with _$GbvAddress {
  const factory GbvAddress({
    required int? id,
    String? country,
    String? city,
    @JsonKey(name: 'latitude', fromJson: _stringOrNullToDoubleConverter)
        latitude,
    @JsonKey(name: 'longitude', fromJson: _stringOrNullToDoubleConverter)
        longitude,
    String? type,
    String? status,
  }) = _GbvAddress;

  factory GbvAddress.fromJson(Map<String, dynamic> json) =>
      _$GbvAddressFromJson(json);
}

double? _stringOrNullToDoubleConverter(dynamic val) =>
    val == null ? null : double.tryParse(val.toString());

@freezed
abstract class GbvReport with _$GbvReport {
  const factory GbvReport({
    String? message,
    String? user_id,
    String? abuse_types_id,
    String? file,
  }) = _GbvReport;

  factory GbvReport.fromJson(Map<String, dynamic> json) =>
      _$GbvReportFromJson(json);
}
