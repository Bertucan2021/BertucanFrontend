import 'package:bertucanfrontend/Data/gbv_centers.dart';
import 'package:bertucanfrontend/Repositories/gbv_repository.dart';
import 'package:bertucanfrontend/Widgets/gbv/bloc/gbv_detail_event.dart';
import 'package:bertucanfrontend/Widgets/gbv/bloc/gbv_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GBVDetailBloc extends Bloc<GBVDetailEvent, GBVDetailState> {
  GBVRepository gbvRepository = GBVRepository();
  GBVDetailBloc({required this.gbvRepository})
      : super(GBVDetailState(
            isLoading: true,
            exceptionError: '',
            gbvCentersData: GBVCentersData())) {
    on<InitializeGBVDetailEvent>((event, emit) async {
      emit(GBVDetailState(
          isLoading: true,
          exceptionError: '',
          gbvCentersData: GBVCentersData()));
      final response = await gbvRepository.getGBVCenterDetail(event.id);

      // ignore: avoid_print
      print(response);
      if (response.id != null) {
        emit(GBVDetailState(
            isLoading: false, gbvCentersData: response, exceptionError: ''));
      }
      emit(GBVDetailState(
          isLoading: false,
          gbvCentersData: response,
          exceptionError: response.toString()));
    });
  }
}
