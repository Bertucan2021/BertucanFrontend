import 'package:bertucanfrontend/Data/report.dart';
import 'package:equatable/equatable.dart';

abstract class GBVReportEvent extends Equatable {
  const GBVReportEvent();
}

class PostGBVReportButtonPressed extends GBVReportEvent {
  const PostGBVReportButtonPressed({required this.reportData});

  final ReportData reportData;

  @override
  List<Object> get props => [reportData];
}
