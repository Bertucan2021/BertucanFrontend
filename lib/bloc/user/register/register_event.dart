
import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable{
  const RegisterEvent();

  @override
  List<Object?> get props => [];
}

class Register extends RegisterEvent{
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String password;

  const Register({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
  required this.password});
}

