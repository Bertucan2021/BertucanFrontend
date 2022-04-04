import 'package:bertucanfrontend/Data/gbv_centers.dart';
import 'package:equatable/equatable.dart';

class GBVDetailState extends Equatable {
  const GBVDetailState(
      {required this.exceptionError,
      required this.isLoading,
      required this.gbvCentersData});

  final bool isLoading;
  final String exceptionError;
  final GBVCentersData gbvCentersData;

  @override
  List<Object> get props => [isLoading, exceptionError, gbvCentersData];

  GBVDetailState copyWith(
      {bool? isLoading,
      String? exceptionError,
      GBVCentersData? gbvCentersData}) {
    return GBVDetailState(
        isLoading: isLoading ?? this.isLoading,
        exceptionError: exceptionError ?? this.exceptionError,
        gbvCentersData: gbvCentersData ?? this.gbvCentersData);
  }
}
