import 'package:bertucanfrontend/Service/http_calls.dart';

import '../Data/abuse_type.dart';
import '../Data/report.dart';

class ReportRepository {
  final HttpCalls _httpCalls = HttpCalls();
  Future<List<AbuseType>> getAbuseType() => _httpCalls.getAbuseType();
  Future<int> postGBVReport(ReportData reportData) =>
      _httpCalls.postGBVReport(reportData);
}
