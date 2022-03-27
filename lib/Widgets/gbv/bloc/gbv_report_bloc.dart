// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:bertucanfrontend/Repositories/gbv_repository.dart';
import 'package:bertucanfrontend/Widgets/gbv/bloc/gbv_report_event.dart';
import 'package:bertucanfrontend/Widgets/gbv/bloc/gbv_report_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

class GBVReportBloc extends Bloc<GBVReportEvent, GBVReportState> {
  GBVRepository gbvRepository = GBVRepository();
  GBVReportBloc({required this.gbvRepository})
      : super(const GBVReportState(
          isLoading: false,
          exceptionError: '',
          created: false,
        )) {
    // ignore: avoid_print
    on<PostGBVReportButtonPressed>((event, emit) async {
      // ignore: avoid_print
      print("working");
      emit(const GBVReportState(
          isLoading: true, exceptionError: '', created: false));
      final response = await gbvRepository.postGBVReport(event.reportData);
      if (response == 201 || response == 200) {
        emit(const GBVReportState(
            isLoading: false, exceptionError: '', created: true));
      }
      emit(const GBVReportState(
          isLoading: false,
          exceptionError: "can not post report",
          created: false));
    });
  }
}
