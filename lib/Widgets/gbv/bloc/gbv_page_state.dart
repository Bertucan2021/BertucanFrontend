import 'package:bertucanfrontend/Data/gbv_centers.dart';
import 'package:equatable/equatable.dart';

class GBVPageState extends Equatable {
  const GBVPageState(
      {required this.exceptionError,
      required this.isLoading,
      required this.gbvCentersData});

  final bool isLoading;
  final String exceptionError;
  final List<GBVCentersData> gbvCentersData;
  final String imageUrl = "https://bertucan.com/public/";

  @override
  List<Object> get props => [isLoading, exceptionError, gbvCentersData];

  GBVPageState copyWith(
      {bool? isLoading,
      String? exceptionError,
      List<GBVCentersData>? gbvCentersData}) {
    return GBVPageState(
        isLoading: isLoading ?? this.isLoading,
        exceptionError: exceptionError ?? this.exceptionError,
        gbvCentersData: gbvCentersData ?? this.gbvCentersData);
  }
}
