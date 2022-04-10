// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:bertucanfrontend/Repositories/report_repository.dart';
import 'package:bertucanfrontend/Widgets/gbv/bloc/gbv_report_event.dart';
import 'package:bertucanfrontend/Widgets/gbv/bloc/gbv_report_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GBVReportBloc extends Bloc<GBVReportEvent, GBVReportState> {
  ReportRepository reportRepository = ReportRepository();
  GBVReportBloc({required this.reportRepository})
      : super(const GBVReportState(
            isLoading: false,
            exceptionError: '',
            created: false,
            abuseType: [],
            isIconLoading: false)) {
    // ignore: avoid_print
    on<PostGBVReportButtonPressed>((event, emit) async {
      // ignore: avoid_print
      print("working");
      emit(const GBVReportState(
          isLoading: true,
          exceptionError: '',
          created: false,
          abuseType: [],
          isIconLoading: false));
      final response = await reportRepository.postGBVReport(event.reportData, event.filePath);
      if (response == 201 || response == 200) {
        emit(const GBVReportState(
            isLoading: false,
            exceptionError: '',
            created: true,
            abuseType: [],
            isIconLoading: false));
      }
      emit(const GBVReportState(
          isLoading: false,
          exceptionError: "can not post report",
          created: false,
          abuseType: [],
          isIconLoading: false));
    });

    on<DropDownIconPressed>((event, emit) async {
      final response = await reportRepository.getAbuseType();
      // ignore: avoid_print
      if (response.isNotEmpty) {
        emit(GBVReportState(
            isLoading: false,
            exceptionError: '',
            created: false,
            abuseType: response,
            isIconLoading: false));
      } else {
        emit(const GBVReportState(
            isLoading: false,
            exceptionError: "can not post report",
            created: false,
            abuseType: [],
            isIconLoading: false));
      }
    });
  }
}
