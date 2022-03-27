import 'package:bertucanfrontend/Data/gbv_centers.dart';
import 'package:bertucanfrontend/Service/http_calls.dart';
import 'package:bertucanfrontend/Data/report.dart';

class GBVRepository {
  final HttpCalls _httpCalls = HttpCalls();
  Future<List<GBVCentersData>> getGBVCenters() => _httpCalls.getGBVCenters();
  Future<GBVCentersData> getGBVCenterDetail(int id) =>
      _httpCalls.getGBVCenterDetail(id);
  Future<int> postGBVReport(ReportData reportData) =>
      _httpCalls.postGBVReport(reportData);
}
