import 'dart:io';
import 'package:bertucanfrontend/Data/report.dart';
import 'package:equatable/equatable.dart';

abstract class GBVReportEvent extends Equatable {
  const GBVReportEvent();
}

class PostGBVReportButtonPressed extends GBVReportEvent {
   const PostGBVReportButtonPressed(
      {required this.reportData, required this.filePath});

  final ReportData reportData;
  final File filePath;

  @override
  List<Object> get props => [reportData, filePath];
}

class DropDownIconPressed extends GBVReportEvent {
  const DropDownIconPressed();

  @override
  List<Object> get props => [];
}
