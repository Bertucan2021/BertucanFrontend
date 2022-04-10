
import 'package:equatable/equatable.dart';
abstract class RegisterState extends Equatable{
  const RegisterState();

  @override
  List<Object?> get props => [];
}

class RegisterInitialState extends RegisterState{}

class RegisterLoadingState extends RegisterState{}

class RegisterSuccessState extends RegisterState{

  const RegisterSuccessState();
}


class RegisterErrorState extends RegisterState{
  final int statusCode;
  final String? errorMessage;

  const RegisterErrorState({required this.statusCode, this.errorMessage});
}
