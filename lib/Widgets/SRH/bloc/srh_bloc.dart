// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:bertucanfrontend/Repositories/srh_repository.dart';
import 'package:bertucanfrontend/Widgets/SRH/bloc/srh_event.dart';
import 'package:bertucanfrontend/Widgets/SRH/bloc/srh_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SRHBloc extends Bloc<SRHEvent, SRHState> {
  SRHRepository srhRepository = SRHRepository();
  SRHBloc({required this.srhRepository})
      : super(const SRHState(
            isLoading: true, articleData: [], exceptionError: '')) {
    // ignore: avoid_print
    on<InitializeSRH>((event, emit) async {
      // ignore: avoid_print
      emit(
          const SRHState(isLoading: true, articleData: [], exceptionError: ''));
      final response = await srhRepository.getSRHArticles();
      if (response.isNotEmpty) {
        emit(SRHState(
            isLoading: false, articleData: response, exceptionError: ''));
      }
      emit(SRHState(
          isLoading: false,
          articleData: response,
          exceptionError: response.toString()));
    });
  }
}
