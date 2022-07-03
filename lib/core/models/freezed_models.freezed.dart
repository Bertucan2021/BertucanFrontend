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
  String get email => throw _privateConstructorUsedError;
  @override
  String get phoneNumber => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
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
  String get email => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserToLoginCopyWith<_$_UserToLogin> get copyWith =>
      throw _privateConstructorUsedError;
}
