// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'freezed_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserToSignUp _$UserToSignUpFromJson(Map<String, dynamic> json) {
  return _UserToSignUp.fromJson(json);
}

/// @nodoc
mixin _$UserToSignUp {
  String get email => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserToSignUpCopyWith<UserToSignUp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserToSignUpCopyWith<$Res> {
  factory $UserToSignUpCopyWith(
          UserToSignUp value, $Res Function(UserToSignUp) then) =
      _$UserToSignUpCopyWithImpl<$Res>;
  $Res call({String email, String phoneNumber, String password, String name});
}

/// @nodoc
class _$UserToSignUpCopyWithImpl<$Res> implements $UserToSignUpCopyWith<$Res> {
  _$UserToSignUpCopyWithImpl(this._value, this._then);

  final UserToSignUp _value;
  // ignore: unused_field
  final $Res Function(UserToSignUp) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? password = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_UserToSignUpCopyWith<$Res>
    implements $UserToSignUpCopyWith<$Res> {
  factory _$$_UserToSignUpCopyWith(
          _$_UserToSignUp value, $Res Function(_$_UserToSignUp) then) =
      __$$_UserToSignUpCopyWithImpl<$Res>;
  @override
  $Res call({String email, String phoneNumber, String password, String name});
}

/// @nodoc
class __$$_UserToSignUpCopyWithImpl<$Res>
    extends _$UserToSignUpCopyWithImpl<$Res>
    implements _$$_UserToSignUpCopyWith<$Res> {
  __$$_UserToSignUpCopyWithImpl(
      _$_UserToSignUp _value, $Res Function(_$_UserToSignUp) _then)
      : super(_value, (v) => _then(v as _$_UserToSignUp));

  @override
  _$_UserToSignUp get _value => super._value as _$_UserToSignUp;

  @override
  $Res call({
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? password = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_UserToSignUp(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserToSignUp implements _UserToSignUp {
  const _$_UserToSignUp(
      {required this.email,
      required this.phoneNumber,
      required this.password,
      required this.name});

  factory _$_UserToSignUp.fromJson(Map<String, dynamic> json) =>
      _$$_UserToSignUpFromJson(json);

  @override
  final String email;
  @override
  final String phoneNumber;
  @override
  final String password;
  @override
  final String name;

  @override
  String toString() {
    return 'UserToSignUp(email: $email, phoneNumber: $phoneNumber, password: $password, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserToSignUp &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_UserToSignUpCopyWith<_$_UserToSignUp> get copyWith =>
      __$$_UserToSignUpCopyWithImpl<_$_UserToSignUp>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToSignUpToJson(this);
  }
}

abstract class _UserToSignUp implements UserToSignUp {
  const factory _UserToSignUp(
      {required final String email,
      required final String phoneNumber,
      required final String password,
      required final String name}) = _$_UserToSignUp;

  factory _UserToSignUp.fromJson(Map<String, dynamic> json) =
      _$_UserToSignUp.fromJson;

  @override
  String get email;
  @override
  String get phoneNumber;
  @override
  String get password;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_UserToSignUpCopyWith<_$_UserToSignUp> get copyWith =>
      throw _privateConstructorUsedError;
}

UserToLogin _$UserToLoginFromJson(Map<String, dynamic> json) {
  return _UserToLogin.fromJson(json);
}

/// @nodoc
mixin _$UserToLogin {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserToLoginCopyWith<UserToLogin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserToLoginCopyWith<$Res> {
  factory $UserToLoginCopyWith(
          UserToLogin value, $Res Function(UserToLogin) then) =
      _$UserToLoginCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

/// @nodoc
class _$UserToLoginCopyWithImpl<$Res> implements $UserToLoginCopyWith<$Res> {
  _$UserToLoginCopyWithImpl(this._value, this._then);

  final UserToLogin _value;
  // ignore: unused_field
  final $Res Function(UserToLogin) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_UserToLoginCopyWith<$Res>
    implements $UserToLoginCopyWith<$Res> {
  factory _$$_UserToLoginCopyWith(
          _$_UserToLogin value, $Res Function(_$_UserToLogin) then) =
      __$$_UserToLoginCopyWithImpl<$Res>;
  @override
  $Res call({String email, String password});
}

/// @nodoc
class __$$_UserToLoginCopyWithImpl<$Res> extends _$UserToLoginCopyWithImpl<$Res>
    implements _$$_UserToLoginCopyWith<$Res> {
  __$$_UserToLoginCopyWithImpl(
      _$_UserToLogin _value, $Res Function(_$_UserToLogin) _then)
      : super(_value, (v) => _then(v as _$_UserToLogin));

  @override
  _$_UserToLogin get _value => super._value as _$_UserToLogin;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_$_UserToLogin(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserToLogin implements _UserToLogin {
  const _$_UserToLogin({required this.email, required this.password});

  factory _$_UserToLogin.fromJson(Map<String, dynamic> json) =>
      _$$_UserToLoginFromJson(json);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'UserToLogin(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserToLogin &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$$_UserToLoginCopyWith<_$_UserToLogin> get copyWith =>
      __$$_UserToLoginCopyWithImpl<_$_UserToLogin>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToLoginToJson(this);
  }
}

abstract class _UserToLogin implements UserToLogin {
  const factory _UserToLogin(
      {required final String email,
      required final String password}) = _$_UserToLogin;

  factory _UserToLogin.fromJson(Map<String, dynamic> json) =
      _$_UserToLogin.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_UserToLoginCopyWith<_$_UserToLogin> get copyWith =>
      throw _privateConstructorUsedError;
}

Gbv _$GbvFromJson(Map<String, dynamic> json) {
  return _Gbv.fromJson(json);
}

/// @nodoc
mixin _$Gbv {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get phone_number => throw _privateConstructorUsedError;
  int? get address_id => throw _privateConstructorUsedError;
  int? get membership_id => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get license => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  GbvAddress? get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GbvCopyWith<Gbv> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GbvCopyWith<$Res> {
  factory $GbvCopyWith(Gbv value, $Res Function(Gbv) then) =
      _$GbvCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String? name,
      String? description,
      String? phone_number,
      int? address_id,
      int? membership_id,
      String? status,
      String? license,
      String? logo,
      GbvAddress? address});

  $GbvAddressCopyWith<$Res>? get address;
}

/// @nodoc
class _$GbvCopyWithImpl<$Res> implements $GbvCopyWith<$Res> {
  _$GbvCopyWithImpl(this._value, this._then);

  final Gbv _value;
  // ignore: unused_field
  final $Res Function(Gbv) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? phone_number = freezed,
    Object? address_id = freezed,
    Object? membership_id = freezed,
    Object? status = freezed,
    Object? license = freezed,
    Object? logo = freezed,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      phone_number: phone_number == freezed
          ? _value.phone_number
          : phone_number // ignore: cast_nullable_to_non_nullable
              as String?,
      address_id: address_id == freezed
          ? _value.address_id
          : address_id // ignore: cast_nullable_to_non_nullable
              as int?,
      membership_id: membership_id == freezed
          ? _value.membership_id
          : membership_id // ignore: cast_nullable_to_non_nullable
              as int?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      license: license == freezed
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: logo == freezed
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as GbvAddress?,
    ));
  }

  @override
  $GbvAddressCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $GbvAddressCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value));
    });
  }
}

/// @nodoc
abstract class _$$_GbvCopyWith<$Res> implements $GbvCopyWith<$Res> {
  factory _$$_GbvCopyWith(_$_Gbv value, $Res Function(_$_Gbv) then) =
      __$$_GbvCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String? name,
      String? description,
      String? phone_number,
      int? address_id,
      int? membership_id,
      String? status,
      String? license,
      String? logo,
      GbvAddress? address});

  @override
  $GbvAddressCopyWith<$Res>? get address;
}

/// @nodoc
class __$$_GbvCopyWithImpl<$Res> extends _$GbvCopyWithImpl<$Res>
    implements _$$_GbvCopyWith<$Res> {
  __$$_GbvCopyWithImpl(_$_Gbv _value, $Res Function(_$_Gbv) _then)
      : super(_value, (v) => _then(v as _$_Gbv));

  @override
  _$_Gbv get _value => super._value as _$_Gbv;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? phone_number = freezed,
    Object? address_id = freezed,
    Object? membership_id = freezed,
    Object? status = freezed,
    Object? license = freezed,
    Object? logo = freezed,
    Object? address = freezed,
  }) {
    return _then(_$_Gbv(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      phone_number: phone_number == freezed
          ? _value.phone_number
          : phone_number // ignore: cast_nullable_to_non_nullable
              as String?,
      address_id: address_id == freezed
          ? _value.address_id
          : address_id // ignore: cast_nullable_to_non_nullable
              as int?,
      membership_id: membership_id == freezed
          ? _value.membership_id
          : membership_id // ignore: cast_nullable_to_non_nullable
              as int?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      license: license == freezed
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: logo == freezed
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as GbvAddress?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Gbv implements _Gbv {
  const _$_Gbv(
      {required this.id,
      this.name,
      this.description,
      this.phone_number,
      this.address_id,
      this.membership_id,
      this.status,
      this.license,
      this.logo,
      this.address});

  factory _$_Gbv.fromJson(Map<String, dynamic> json) => _$$_GbvFromJson(json);

  @override
  final int id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? phone_number;
  @override
  final int? address_id;
  @override
  final int? membership_id;
  @override
  final String? status;
  @override
  final String? license;
  @override
  final String? logo;
  @override
  final GbvAddress? address;

  @override
  String toString() {
    return 'Gbv(id: $id, name: $name, description: $description, phone_number: $phone_number, address_id: $address_id, membership_id: $membership_id, status: $status, license: $license, logo: $logo, address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Gbv &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.phone_number, phone_number) &&
            const DeepCollectionEquality()
                .equals(other.address_id, address_id) &&
            const DeepCollectionEquality()
                .equals(other.membership_id, membership_id) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.license, license) &&
            const DeepCollectionEquality().equals(other.logo, logo) &&
            const DeepCollectionEquality().equals(other.address, address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(phone_number),
      const DeepCollectionEquality().hash(address_id),
      const DeepCollectionEquality().hash(membership_id),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(license),
      const DeepCollectionEquality().hash(logo),
      const DeepCollectionEquality().hash(address));

  @JsonKey(ignore: true)
  @override
  _$$_GbvCopyWith<_$_Gbv> get copyWith =>
      __$$_GbvCopyWithImpl<_$_Gbv>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GbvToJson(this);
  }
}

abstract class _Gbv implements Gbv {
  const factory _Gbv(
      {required final int id,
      final String? name,
      final String? description,
      final String? phone_number,
      final int? address_id,
      final int? membership_id,
      final String? status,
      final String? license,
      final String? logo,
      final GbvAddress? address}) = _$_Gbv;

  factory _Gbv.fromJson(Map<String, dynamic> json) = _$_Gbv.fromJson;

  @override
  int get id;
  @override
  String? get name;
  @override
  String? get description;
  @override
  String? get phone_number;
  @override
  int? get address_id;
  @override
  int? get membership_id;
  @override
  String? get status;
  @override
  String? get license;
  @override
  String? get logo;
  @override
  GbvAddress? get address;
  @override
  @JsonKey(ignore: true)
  _$$_GbvCopyWith<_$_Gbv> get copyWith => throw _privateConstructorUsedError;
}

GbvAddress _$GbvAddressFromJson(Map<String, dynamic> json) {
  return _GbvAddress.fromJson(json);
}

/// @nodoc
mixin _$GbvAddress {
  int? get id => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  @JsonKey(name: 'latitude', fromJson: _stringOrNullToDoubleConverter)
  dynamic get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'longitude', fromJson: _stringOrNullToDoubleConverter)
  dynamic get longitude => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GbvAddressCopyWith<GbvAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GbvAddressCopyWith<$Res> {
  factory $GbvAddressCopyWith(
          GbvAddress value, $Res Function(GbvAddress) then) =
      _$GbvAddressCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? country,
      String? city,
      @JsonKey(name: 'latitude', fromJson: _stringOrNullToDoubleConverter)
          dynamic latitude,
      @JsonKey(name: 'longitude', fromJson: _stringOrNullToDoubleConverter)
          dynamic longitude,
      String? type,
      String? status});
}

/// @nodoc
class _$GbvAddressCopyWithImpl<$Res> implements $GbvAddressCopyWith<$Res> {
  _$GbvAddressCopyWithImpl(this._value, this._then);

  final GbvAddress _value;
  // ignore: unused_field
  final $Res Function(GbvAddress) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? country = freezed,
    Object? city = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? type = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as dynamic,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as dynamic,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_GbvAddressCopyWith<$Res>
    implements $GbvAddressCopyWith<$Res> {
  factory _$$_GbvAddressCopyWith(
          _$_GbvAddress value, $Res Function(_$_GbvAddress) then) =
      __$$_GbvAddressCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? country,
      String? city,
      @JsonKey(name: 'latitude', fromJson: _stringOrNullToDoubleConverter)
          dynamic latitude,
      @JsonKey(name: 'longitude', fromJson: _stringOrNullToDoubleConverter)
          dynamic longitude,
      String? type,
      String? status});
}

/// @nodoc
class __$$_GbvAddressCopyWithImpl<$Res> extends _$GbvAddressCopyWithImpl<$Res>
    implements _$$_GbvAddressCopyWith<$Res> {
  __$$_GbvAddressCopyWithImpl(
      _$_GbvAddress _value, $Res Function(_$_GbvAddress) _then)
      : super(_value, (v) => _then(v as _$_GbvAddress));

  @override
  _$_GbvAddress get _value => super._value as _$_GbvAddress;

  @override
  $Res call({
    Object? id = freezed,
    Object? country = freezed,
    Object? city = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? type = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_GbvAddress(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: latitude == freezed ? _value.latitude : latitude,
      longitude: longitude == freezed ? _value.longitude : longitude,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GbvAddress implements _GbvAddress {
  const _$_GbvAddress(
      {required this.id,
      this.country,
      this.city,
      @JsonKey(name: 'latitude', fromJson: _stringOrNullToDoubleConverter)
          this.latitude,
      @JsonKey(name: 'longitude', fromJson: _stringOrNullToDoubleConverter)
          this.longitude,
      this.type,
      this.status});

  factory _$_GbvAddress.fromJson(Map<String, dynamic> json) =>
      _$$_GbvAddressFromJson(json);

  @override
  final int? id;
  @override
  final String? country;
  @override
  final String? city;
  @override
  @JsonKey(name: 'latitude', fromJson: _stringOrNullToDoubleConverter)
  final dynamic latitude;
  @override
  @JsonKey(name: 'longitude', fromJson: _stringOrNullToDoubleConverter)
  final dynamic longitude;
  @override
  final String? type;
  @override
  final String? status;

  @override
  String toString() {
    return 'GbvAddress(id: $id, country: $country, city: $city, latitude: $latitude, longitude: $longitude, type: $type, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GbvAddress &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.country, country) &&
            const DeepCollectionEquality().equals(other.city, city) &&
            const DeepCollectionEquality().equals(other.latitude, latitude) &&
            const DeepCollectionEquality().equals(other.longitude, longitude) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(country),
      const DeepCollectionEquality().hash(city),
      const DeepCollectionEquality().hash(latitude),
      const DeepCollectionEquality().hash(longitude),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_GbvAddressCopyWith<_$_GbvAddress> get copyWith =>
      __$$_GbvAddressCopyWithImpl<_$_GbvAddress>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GbvAddressToJson(this);
  }
}

abstract class _GbvAddress implements GbvAddress {
  const factory _GbvAddress(
      {required final int? id,
      final String? country,
      final String? city,
      @JsonKey(name: 'latitude', fromJson: _stringOrNullToDoubleConverter)
          final dynamic latitude,
      @JsonKey(name: 'longitude', fromJson: _stringOrNullToDoubleConverter)
          final dynamic longitude,
      final String? type,
      final String? status}) = _$_GbvAddress;

  factory _GbvAddress.fromJson(Map<String, dynamic> json) =
      _$_GbvAddress.fromJson;

  @override
  int? get id;
  @override
  String? get country;
  @override
  String? get city;
  @override
  @JsonKey(name: 'latitude', fromJson: _stringOrNullToDoubleConverter)
  dynamic get latitude;
  @override
  @JsonKey(name: 'longitude', fromJson: _stringOrNullToDoubleConverter)
  dynamic get longitude;
  @override
  String? get type;
  @override
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$_GbvAddressCopyWith<_$_GbvAddress> get copyWith =>
      throw _privateConstructorUsedError;
}
