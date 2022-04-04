import 'package:equatable/equatable.dart';

class User  extends Equatable{
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String password;
  final String role;
  final String rememberToken;
  final String address;

  const User({
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNumber,
        required this.password,
      required this.role,
      required this.rememberToken,
      required this.address});

  factory User.fromJson(Map<String, dynamic> json){
    print('WE got $json');
    User user = User(
      firstName: "",
      lastName: "",
      email: json['email'],
      phoneNumber: json['phone_number'],
      password: "",
      role: json['role'],
      rememberToken: json['remember_token'],
      address: ""
    );
    print('this. user = $user');
    return  user;
  }

@override
  String toString() {
    return 'User {first_name: $firstName, last_name: $lastName, email: $email, phone_number: $phoneNumber, role: $role, remember_token: $rememberToken}';
  }

  @override
  List<Object?> get props => [firstName, lastName, email, phoneNumber, password, role, rememberToken, address];
}
