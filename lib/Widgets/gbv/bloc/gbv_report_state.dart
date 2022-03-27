import 'package:equatable/equatable.dart';

class GBVReportState extends Equatable {
  const GBVReportState(
      {required this.exceptionError,
      required this.isLoading,
      required this.created});

  final bool isLoading;
  final String exceptionError;
  final bool created;

  @override
  List<Object> get props => [isLoading, exceptionError, created];

  GBVReportState copyWith(
      {bool? isLoading,
      String? exceptionError,
      bool? created}) {
    return GBVReportState(
        isLoading: isLoading ?? this.isLoading,
        exceptionError: exceptionError ?? this.exceptionError,
        created: created ?? this.created);
  }
}
