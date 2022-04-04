import 'package:bertucanfrontend/Local_database/sqlite.dart';
import 'package:bertucanfrontend/Repositories/user_repository.dart';
import 'package:bertucanfrontend/bloc/user/register/register_event.dart';
import 'package:bertucanfrontend/bloc/user/register/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';

import '../../../Model/user_model.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  UserRepository userRepository;
  RegisterBloc({required this.userRepository}) : super(RegisterInitialState()) {
    on<Register>((event, emit) async {
      emit(RegisterLoadingState());
      try {
        var registered = await userRepository.storeUser(
            firstName: event.firstName,
            lastName: event.lastName,
            email: event.email,
            password: event.password,
            phone: event.phoneNumber);
        print(registered);
        emit(const RegisterSuccessState());
      } catch (e) {
        emit(RegisterErrorState(statusCode: 404, errorMessage: e.toString().replaceAll('Exception: ', '')));
      }
    });
  }
}
