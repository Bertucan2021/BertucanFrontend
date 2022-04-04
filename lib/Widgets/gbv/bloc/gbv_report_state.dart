import 'package:equatable/equatable.dart';
import 'package:bertucanfrontend/Data/abuse_type.dart';

class GBVReportState extends Equatable {
  const GBVReportState(
      {required this.exceptionError,
      required this.isIconLoading,
      required this.isLoading,
      required this.created,
      required this.abuseType
      });

  final bool isLoading;
  final String exceptionError;
  final bool isIconLoading;
  final bool created;
  final List<AbuseType> abuseType;

  @override
  List<Object> get props => [isLoading, exceptionError, created,abuseType];

  GBVReportState copyWith(
      {bool? isLoading,
      bool? isIconLoading,
      String? exceptionError,
      bool? created,
      List<AbuseType>? abuseType}) {
    return GBVReportState(
        isLoading: isLoading ?? this.isLoading,
        isIconLoading: isIconLoading ?? this.isIconLoading,
        exceptionError: exceptionError ?? this.exceptionError,
        created: created ?? this.created,
        abuseType: abuseType ?? this.abuseType);
  }
}
