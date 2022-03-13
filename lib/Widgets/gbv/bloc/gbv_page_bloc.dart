// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:bertucanfrontend/Repositories/gbv_repository.dart';
import 'package:bertucanfrontend/Widgets/gbv/bloc/gbv_page_event.dart';
import 'package:bertucanfrontend/Widgets/gbv/bloc/gbv_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GBVPageBloc extends Bloc<GBVPageEvent, GBVPageState> {
  GBVRepository gbvRepository = GBVRepository();
  GBVPageBloc({required this.gbvRepository})
      : super(const GBVPageState(
            isLoading: true, gbvCentersData: [], exceptionError: '')) {
    // ignore: avoid_print
    on<InitializeGBVCenters>((event, emit) async {
      // ignore: avoid_print
      emit(const GBVPageState(
          isLoading: true, gbvCentersData: [], exceptionError: ''));
      final response = await gbvRepository.getGBVCenters();
      if (response.isNotEmpty) {
        emit(GBVPageState(
            isLoading: false, gbvCentersData: response, exceptionError: ''));
      }
      emit(GBVPageState(
          isLoading: false,
          gbvCentersData: response,
          exceptionError: response.toString()));
    });
  }
}
